import React from "react";
import "../../bundles/i18n/ja.js";
import { Table, Row, Card, Col } from "antd";
class H2TypeAndTitle extends React.Component {
  state = {};
  createTableData = () => {
    var tableData = [];

    const { allData, selectedSite, h2Count, h2Total } = this.props;

    var row = {
      type_title: "分類の種類",
    };
    let siteCount;
    const result = _.uniqBy(allData, (e) => {
      return [e.header_classification_dict_id, e.site_info_id].join();
    });
    selectedSite.map((h2Site, index) => {
      const typeAndTitle = result.filter(
        (item) => item.site_info_id === h2Site
      );
      siteCount = typeAndTitle.length;
      if (siteCount < h2Count) row["status" + (index + 1)] = "○";
      else if ((siteCount = h2Count)) row["status" + (index + 1)] = "=";
      else row["status" + (index + 1)] = "×";
    });

    tableData.push(row);
    var row1 = {
      type_title: "見出しの数",
    };
    let siteTotal = 0;
    selectedSite.map((h2Site, index) => {
      const typeAndTitle = allData.filter(
        (item) => item.site_info_id === h2Site
      );
      siteTotal = typeAndTitle.length;
      if (siteTotal < h2Total) row1["status" + (index + 1)] = "○";
      else if ((siteTotal = h2Total)) row1["status" + (index + 1)] = "=";
      else row1["status" + (index + 1)] = "×";
    });

    tableData.push(row1);
    return tableData;
  };
  render() {
    let columns = [];
    columns.push({
      title: "",
      dataIndex: "type_title",
    });
    this.props.selectedSite.map((siteno, index) => {
      columns.push({
        title: "サイト" + siteno,
        dataIndex: `status${index + 1}`,
      });
    });

    const tableData = this.createTableData();
    return (
      <>
        <Card className="h-50 d-flex flex-column">
          <div>各サイトに対する優位性（幅）</div>
          <Row>
            <Col span={10}>
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
          <div>✕、＝が表示されても競合サイトに勝てる部分があればよい</div>
        </Card>
      </>
    );
  }
}

export default H2TypeAndTitle;
