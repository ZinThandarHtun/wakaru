import React from "react";
import "../../bundles/i18n/ja.js";
import { Table, Card } from "antd";
import Column from "antd/lib/table/Column.js";
class OutlineDetailInfoWritingPolicy extends React.Component {
  state = {
    detail: [],
    total_word_count: 0,
  };

  render(data) {
    return (
      <>
        <div
          className="site-layout-background"
          style={{ padding: 24, minHeight: 360 }}
        >
          <Card className="h-50 d-flex flex-column">
            <div>
              文字数計:
              {this.props.total_word_count}
            </div>
            <Table
              align="center"
              bordered
              style={{ marginTop: 10 }}
              className="ant-table-tbody"
              headerClassName={this.header}
              dataSource={this.props.outlineDetailDataSource}
              columns={this.columns}
              pagination={false}
            >
              <Column
                title="レベル"
                width="20%"
                dataIndex="header_type"
                key="header_type"
                render={(text, record) => {
                  if (record.header_type == "h3")
                    return (
                      <div style={{ textAlign: "center" }}>
                        {record.header_type}
                      </div>
                    );
                  else if (record.header_type == "h2")
                    return (
                      <div style={{ textAlign: "left" }}>
                        <b>{record.header_type}</b>
                      </div>
                    );
                  else
                    return (
                      <div style={{ textAlign: "left" }}>
                        {record.header_type}
                      </div>
                    );
                }}
              />
              <Column
                title="見出し文言"
                width="20%"
                dataIndex="header_title"
                key="header_title"
              />
              <Column
                title="詳細"
                width="35%"
                dataIndex="header_detail"
                key="header_detail"
              />
              <Column
                title="参考URL"
                width="15%"
                dataIndex="ref_url"
                key="ref_url"
              />
              <Column
                title="文字数目安"
                width="10%"
                dataIndex="word_count"
                key="word_count"
              />
            </Table>
          </Card>
        </div>
      </>
    );
  }
}

export default OutlineDetailInfoWritingPolicy;
