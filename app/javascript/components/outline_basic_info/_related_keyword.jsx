import React from "react";
import "../../bundles/i18n/ja.js";
import { Table, Row, Card, Col } from "antd";
class Keyword extends React.Component {
  state = {};

  columns = [
    {
      title: "関連キーワード一覧",
      dataIndex: "keyword",
      key: "keyword",
    },
    {
      title: "検索vol",
      dataIndex: "search_volume",
      key: "search_volume",
    },
  ];
  h2columns = [
    {
      title: "名詞",
      dataIndex: "name",
      key: "name",
    },
    {
      title: "使用率",
      children: [
        {
          title: "選定サイト",
          dataIndex: "choose_site",
          key: "choose_site",
          width: 100,
        },
      ],
    },
    {
      title: "使用回数",
      children: [
        {
          title: "選定サイト(平均）",
          dataIndex: "average_site",
          key: "average_site",
          width: 100,
        },
        {
          title: "現在の骨子",
          dataIndex: "average_time",
          key: "average_time",
          width: 100,
        },
      ],
    },
  ];

  render() {
    let { h2h3Data } = this.props;
    return (
      <>
        <Card className="h-50 d-flex flex-column">
          <Row>
            <Col span={11}>
              <Table
                align="center"
                bordered={true}
                style={{ marginTop: 10 }}
                className="ant-table-thead"
                headerClassName={this.header}
                dataSource={this.props.relatedKeywords}
                columns={this.columns}
                pagination={false}
              />
            </Col>
            <Col span={2}></Col>
            <Col span={11}>
              <div
                style={{
                  width: "100%",
                  marginRight: "40px",
                }}
              >
                <Table
                  className="conflict-list-table"
                  tableLayout="fixed"
                  columns={this.h2columns}
                  dataSource={h2h3Data}
                  bordered={true}
                  pagination={false}
                />
              </div>
            </Col>
          </Row>
        </Card>
      </>
    );
  }
}

export default Keyword;
