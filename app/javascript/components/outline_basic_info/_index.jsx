import React from "react";
import "../../bundles/i18n/ja.js";
import { Tabs, Row, Col, Button } from "antd";
import OutlineBasicInfoWritingPolicy from "./_writing_policy.jsx";
import OutlineDetailInfoWritingPolicy from "./_outline_detail_info.jsx";
import Personal from "./_personal.jsx";
import Comflit from "./_comflit.jsx";
import Keyword from "./_related_keyword.jsx";
import H2Condition from "./_h2_condition.jsx";
import H3Condition from "./_h3_condition.jsx";
import H2TypeAndTitle from "./_h2_type.jsx";
import H3TypeAndTitle from "./_h3_type.jsx";
import { Footer } from "antd/lib/layout/layout.js";
const TabPane = Tabs.TabPane;
class OutlineBasicInfo extends React.Component {
  state = {
    outlineBasicInfo: [],
    outlineDetailInfo: [],
    totalWordCount: null,
    conflictData: [],
    conflictDataList: [],
    relatedKeywordList: [],
    h2h3DataList: [],
    h2h3DataNameList: [],
    useSite: [],
    useSiteFinal: [],
    h2Condition: [],
    headerClassificationDict: [],
    headerClassificationDicts: [],
    headerClassification: [],
    h2ConditionOwnSiteCounts: [],
    siteNo: [],
    keySite: [],
    allData: [],
    h3AllData: [],
    h3Condition: [],
    h3HeaderClassificationDicts: [],
    h3ConditionOwnSiteCounts: [],
    h3SiteNo: [],
    h2Count: 0,
    h2Total: 0,
    h3Count: 0,
    h3Total: 0,
  };

  loadOulineBasicInfo = () => {
    const url = "/api/v1/outline_basic_info/personal";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        data.person.forEach((person) => {
          const newN2 = {
            key: person.id,
            id: person.id,
            user_attribute: person.user_attribute,
            search_condition: person.search_condition,
            title: person.title,
            article_width: person.article_width,
            article_depth: person.article_depth,
            article_readability: person.article_readability,
            cv_guidance: person.cv_guidance,
            cv_name: person.cv_name,
            destination_url: person.destination_url,
            feature_image: person.feature_image,
          };

          this.setState((prevState) => ({
            outlineBasicInfo: [...prevState.outlineBasicInfo, newN2],
          }));
        });
        let total_word_count = 0;
        data.person.forEach((person) => {
          const newN1 = {
            key: person.id,
            id: person.id,
            header_type: person.lead_sentence,
            word_count: person.lead_sentence_count,
          };

          this.setState((prevState) => ({
            outlineDetailInfo: [...prevState.outlineDetailInfo, newN1],
          }));
          total_word_count += person.lead_sentence_count;
        });

        data.detail.forEach((detail) => {
          const newN1 = {
            key: detail.id,
            id: detail.id,
            header_type: detail.header_type,
            header_title: detail.header_title,
            header_detail: detail.header_detail,
            ref_url: detail.ref_url,
            word_count: detail.word_count,
          };

          total_word_count += detail.word_count;
          this.setState({ totalWordCount: total_word_count });
          this.setState((prevState) => ({
            outlineDetailInfo: [...prevState.outlineDetailInfo, newN1],
          }));
        });
      });
  };

  componentDidMount() {
    this.loadComflit();
    this.loadOulineBasicInfo();
    this.loadRelatedkeywords();
    this.loadH2Conditon();
    this.loadH3Conditon();
  }
  loadRelatedkeywords = () => {
    const url = "/api/v1/outline_basic_info/relatedKeywords";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        data.relatedKeywords.forEach((relatedKeywords) => {
          const newN1 = {
            key: relatedKeywords.id,
            id: relatedKeywords.id,
            keyword: relatedKeywords.keyword,
            search_volume: relatedKeywords.search_volume,
          };

          this.setState((prevState) => ({
            relatedKeywordList: [...prevState.relatedKeywordList, newN1],
          }));
        });
        if (data.resulth2.length > 0) {
          const h2h3Data = [];

          data.resulth2.map((siteH2Info, index) => {
            if (siteH2Info.h2_nouns != null) {
              siteH2Info.h2_nouns.map((h2nouns, index) => {
                h2h3Data.push({
                  name: h2nouns,
                });
              });
            }
            siteH2Info.site_h3_infos.map((siteH3Info, index) => {
              if (siteH3Info.h3_nouns != null) {
                siteH3Info.h3_nouns.map((h3nouns, index) => {
                  h2h3Data.push({
                    name: h3nouns,
                  });
                });
              }
            });
          });
          this.setState({
            h2h3DataList: [...new Set(h2h3Data.map((x) => x.name))],
          });
        }

        this.state.h2h3DataList.map((list) => {
          let siteCountNoun = 0;
          let siteCountNounTime = 0;
          let h2h3h4Time = 0;
          if (data.userSiteResult.length > 0) {
            const useSiteArray = [];
            data.userSiteResult.map((useSite) => {
              const nounArray = [];
              useSite.site_h2_infos.map((siteH2Info) => {
                siteH2Info.h2_nouns.map((noun, index) => {
                  nounArray.push({ noun: noun });
                });
                siteH2Info.site_h3_infos.map((siteH3Info, index) => {
                  siteH3Info.h3_nouns.map((nouns, index) => {
                    nounArray.push({ noun: nouns });
                  });
                });
              });
              this.setState({
                useSite: nounArray,
              });

              useSiteArray.push({ h2h3Nouns: this.state.useSite });
            });
            this.setState({ useSiteFinal: useSiteArray });
            this.state.useSiteFinal.map((siteCount, index) => {
              const findNoun = siteCount.h2h3Nouns.filter(
                (x) => x.noun === list
              );
              if (findNoun.length > 0) {
                siteCountNoun = siteCountNoun + 1;
              }
              findNoun.map((time, index) => {
                siteCountNounTime = siteCountNounTime + 1;
              });
              const headerTitleCount = data.h2h3h4.filter(
                (time) => time.header_title === list
              );
              headerTitleCount.map((htCount, index) => {
                h2h3h4Time += 1;
              });
            });
          }
          this.state.h2h3DataNameList.push({
            name: list,
            choose_site:
              ((siteCountNoun / data.totalSite) * 100).toString() + "%",
            average_site:
              (siteCountNounTime / data.totalSite).toString() + "回",
            average_time: h2h3h4Time.toString() + "回",
          });
        });
      });
  };

  loadComflit = () => {
    const url = "/api/v1/outline_basic_info/siteInfo";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        this.setState({
          headerClassificationDict: data.headerClassification,
        });

        if (data.resultdata.length > 0) {
          const conflictDataList = [];

          data.resultdata.map((siteInfo, index) => {
            const conflictData = [];

            siteInfo.site_h2_infos.map((siteH2Info, index) => {
              if (siteH2Info.h2 != null) {
                if (siteH2Info.header_classification_dict_id != null) {
                  const headerClassificationDict =
                    this.state.headerClassificationDict.find(
                      (headerClassificationDict) =>
                        headerClassificationDict.id ==
                        siteH2Info.header_classification_dict_id
                    );
                  conflictData.push({
                    key: "h2" + siteH2Info.id,
                    tag: "h2",
                    articleHeadline: siteH2Info.h2,

                    classificationItem:
                      headerClassificationDict.header_classification,
                  });
                } else {
                  conflictData.push({
                    key: "h2" + siteH2Info.id,
                    tag: "h2",
                    articleHeadline: siteH2Info.h2,
                    classificationItem: "",
                  });
                }
              }

              siteH2Info.site_h3_infos.map((siteH3Info, index) => {
                if (siteH3Info.h3 != null) {
                  if (siteH3Info.header_classification_dict_id != null) {
                    const headerClassificationDict =
                      this.state.headerClassificationDict.find(
                        (headerClassificationDict) =>
                          headerClassificationDict.id ==
                          siteH3Info.header_classification_dict_id
                      );

                    conflictData.push({
                      key: "h3" + siteH3Info.id,
                      tag: "h3",
                      articleHeadline: siteH3Info.h3,

                      classificationItem:
                        headerClassificationDict.header_classification,
                    });
                  } else {
                    conflictData.push({
                      key: "h3" + siteH3Info.id,
                      tag: "h3",
                      articleHeadline: siteH3Info.h3,
                      classificationItem: "",
                    });
                  }
                }
              });
            }),
              this.setState({ conflictData: conflictData }),
              conflictDataList.push({
                siteTitle: siteInfo.site_title,
                siteUrl: siteInfo.site_url,
                conflictData: this.state.conflictData,
              });
          });

          this.setState({ conflictDataList: conflictDataList });
        }
      });
  };
  loadH2Conditon = () => {
    const url = "/api/v1/outline_basic_info/siteH2Condition";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        const headerClassificationArray = [];
        const h2ConditionOwnSiteCountsArray = [];
        const ArysiteNo = [];
        this.setState({
          allData: data.h2Condition,
        });
        this.setState({
          headerClassificationDicts: data.HeaderClassificationDicts,
        });
        this.state.allData.map((headerClassification, index) => {
          headerClassificationArray.push({
            header_classification_dict_id:
              headerClassification.header_classification_dict_id,
            header_classification: headerClassification.header_classification,
          });
          ArysiteNo.push({
            site_info_id: headerClassification.site_info_id,
            site_no: headerClassification.site_no,
          });
        });
        this.setState({
          h2Condition: [
            ...new Set(
              headerClassificationArray.map(
                (x) => x.header_classification_dict_id
              )
            ),
          ],
        });
        this.state.h2Condition.map((siteCounts, index) => {
          const site = this.state.allData.filter(
            (hc) => hc.header_classification_dict_id === siteCounts
          );

          let maxCompetingSiteValue = 0;
          let maxOwnSiteValue = 0;

          for (let i = 0; i <= Object.keys(site).length - 1; i++) {
            if (site[i].competingsite_h2_count > maxCompetingSiteValue) {
              maxCompetingSiteValue = site[i].competingsite_h2_count;
            }
            if (site[i].ownsite_h2_count) {
              maxOwnSiteValue += site[i].ownsite_h2_count;
            }
          }

          h2ConditionOwnSiteCountsArray.push({
            header_classification_dict_id: siteCounts,
            competingsite_h2_count: maxCompetingSiteValue,
            ownsite_h2_count: maxOwnSiteValue,
          });
        });
        this.setState({
          h2ConditionOwnSiteCounts: h2ConditionOwnSiteCountsArray,
        });
        this.setState({
          siteNo: [...new Set(ArysiteNo.map((x) => x.site_info_id))],
        });

        let count = 0;
        for (let i = 0; i <= h2ConditionOwnSiteCountsArray.length - 1; i++) {
          if (h2ConditionOwnSiteCountsArray[i].competingsite_h2_count > 0) {
            count += 1;
          }
        }
        let total = 0;
        for (let i = 0; i <= h2ConditionOwnSiteCountsArray.length - 1; i++) {
          total += h2ConditionOwnSiteCountsArray[i].ownsite_h2_count;
        }
        this.setState({ h2Total: total });
        this.setState({ h2Count: count });
      });
  };
  loadH3Conditon = () => {
    const url = "/api/v1/outline_basic_info/siteH3Condition";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        const h3HeaderClassificationArray = [];
        const h3ConditionOwnSiteCountsArray = [];
        const h3ArySiteNo = [];
        this.setState({
          h3AllData: data.h3Condition,
        });
        this.setState({
          h3HeaderClassificationDicts: data.h3HeaderClassificationDicts,
        });
        this.state.h3AllData.map((headerClassification, index) => {
          h3HeaderClassificationArray.push({
            header_classification_dict_id:
              headerClassification.header_classification_dict_id,
            header_classification: headerClassification.header_classification,
          });
          h3ArySiteNo.push({
            site_info_id: headerClassification.site_info_id,
            site_no: headerClassification.site_no,
          });
        });
        this.setState({
          h3Condition: [
            ...new Set(
              h3HeaderClassificationArray.map(
                (x) => x.header_classification_dict_id
              )
            ),
          ],
        });
        this.setState({
          h3SiteNo: [...new Set(h3ArySiteNo.map((x) => x.site_info_id))],
        });
        this.state.h3Condition.map((siteCounts, index) => {
          const site = this.state.h3AllData.filter(
            (hc) => hc.header_classification_dict_id === siteCounts
          );

          let maxCompetingSiteValue = 0;
          let totalOwnSiteValue = 0;

          for (let i = 0; i <= Object.keys(site).length - 1; i++) {
            if (site[i].competingsite_h3_count > maxCompetingSiteValue) {
              maxCompetingSiteValue = site[i].competingsite_h3_count;
            }
            if (site[i].ownsite_h3_count) {
              totalOwnSiteValue += site[i].ownsite_h3_count;
            }
          }

          h3ConditionOwnSiteCountsArray.push({
            header_classification_dict_id: siteCounts,
            competingsite_h3_count: maxCompetingSiteValue,
            ownsite_h3_count: totalOwnSiteValue,
          });
        });
        this.setState({
          h3ConditionOwnSiteCounts: h3ConditionOwnSiteCountsArray,
        });
        let count = 0;
        for (let i = 0; i <= h3ConditionOwnSiteCountsArray.length - 1; i++) {
          if (h3ConditionOwnSiteCountsArray[i].competingsite_h3_count > 0) {
            count += 1;
          }
        }
        let total = 0;
        for (let i = 0; i <= h3ConditionOwnSiteCountsArray.length - 1; i++) {
          total += h3ConditionOwnSiteCountsArray[i].ownsite_h3_count;
        }
        this.setState({ h3Total: total });
        this.setState({ h3Count: count });
      });
  };
  onChange = (key) => {};
  render() {
    return (
      <>
        <Tabs defaultActiveKey="1" className="ant-tabs-tab-btn">
          <TabPane tab="構成案" key="1">
            <Personal personalDataSource={this.state.outlineBasicInfo} />
            <OutlineBasicInfoWritingPolicy
              writingPolicyDataSource={this.state.outlineBasicInfo}
            />
            <OutlineDetailInfoWritingPolicy
              outlineDetailDataSource={this.state.outlineDetailInfo}
              total_word_count={this.state.totalWordCount}
            />
          </TabPane>
          <TabPane tab="競合データ" key="2">
            <Comflit conflictData={this.state.conflictDataList} />
          </TabPane>
          <TabPane tab="見出し分類状況（幅）" key="3">
            <H2Condition
              allData={this.state.allData}
              headerClassificationDicts={this.state.headerClassificationDicts}
              h2Classifications={this.state.h2Condition}
              selectedSite={this.state.siteNo}
              h2ConditionOwnSiteCounts={this.state.h2ConditionOwnSiteCounts}
            />
            <H2TypeAndTitle
              allData={this.state.allData}
              selectedSite={this.state.siteNo}
              h2Count={this.state.h2Count}
              h2Total={this.state.h2Total}
            />
          </TabPane>
          <TabPane tab="見出し分類状況（深さ）" key="4">
            <H3Condition
              allData={this.state.h3AllData}
              h3HeaderClassificationDicts={
                this.state.h3HeaderClassificationDicts
              }
              h3Classifications={this.state.h3Condition}
              selectedSite={this.state.h3SiteNo}
              h3ConditionOwnSiteCounts={this.state.h3ConditionOwnSiteCounts}
            />
            <H3TypeAndTitle
              allData={this.state.h3AllData}
              selectedSite={this.state.h3SiteNo}
              h3Count={this.state.h3Count}
              h3Total={this.state.h3Total}
            />
          </TabPane>
          <TabPane tab="キーワードデータ" key="5">
            <Keyword
              relatedKeywords={this.state.relatedKeywordList}
              h2h3Data={this.state.h2h3DataNameList}
            />
          </TabPane>
        </Tabs>

        <Footer style={{ padding: "0px", bottom: "10px" }}>
          <Row className="ant-row ant-row-space-between ant-row-middle">
            <Col
              style={{
                textAlign: "right",
              }}
            >
              <Button type="primary">Excel出力</Button>
            </Col>
          </Row>
        </Footer>
      </>
    );
  }
}

export default OutlineBasicInfo;
