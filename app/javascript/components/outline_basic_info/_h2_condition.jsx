import React from "react";
import "../../bundles/i18n/ja.js";
import { Table, Row, Card, Col } from "antd";
class H2Condition extends React.Component {
  state = {};
  createTableData = () => {
    var tableData = [];

    const {
      allData,
      selectedSite,
      h2ConditionOwnSiteCounts,
      h2Classifications,
      headerClassificationDicts,
    } = this.props;

    h2Classifications.map((headerClassification) => {
      var row = {
        key: headerClassification,
        header_classification: headerClassificationDicts.map((hc) =>
          hc.id === headerClassification ? hc.header_classification : ""
        ),
      };
      selectedSite.map((site, index) => {
        const i = allData.filter(
          (allData) =>
            allData.header_classification_dict_id === headerClassification &&
            allData.site_no === site
        );
        row["status" + (index + 1)] = i.length;
      });
      const maxiSiteCount = h2ConditionOwnSiteCounts.filter(
        (competingAndOwnSiteCount) =>
          competingAndOwnSiteCount.header_classification_dict_id ===
          headerClassification
      );
      row["competing_site_count"] = maxiSiteCount[0].competingsite_h2_count;
      row["own_site_count"] = maxiSiteCount[0].ownsite_h2_count;
      tableData.push(row);
    });
    return tableData;
  };
  render() {
    let columns = [];
    columns.push({
      title: "分類項目",
      dataIndex: "header_classification",
    });
    this.props.selectedSite.map((siteno, index) => {
      columns.push({
        title: "サイト" + siteno,
        dataIndex: `status${index + 1}`,
      });
    });
    columns.push({
      title: "作るべき見出し数",
      dataIndex: "competing_site_count",
    });
    columns.push({
      title: "自サイトの現状",
      dataIndex: "own_site_count",
    });
    const tableData = this.createTableData();
    return (
      <>
        <Card className="h-50 d-flex flex-column">
          <div>各サイトの分類状況（幅）</div>
          <Row>
            <Col span={18}>
              <Table
                align="center"
                bordered
                style={{ marginTop: 10 }}
                className="ant-table-thead"
                headerClassName={this.header}
                dataSource={tableData}
                columns={columns}
                pagination={false}
              />
            </Col>
            <Col span={6}></Col>
          </Row>
        </Card>
      </>
    );
  }
}

export default H2Condition;
