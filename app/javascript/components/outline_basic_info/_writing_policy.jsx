import React from "react";
import "../../bundles/i18n/ja.js";
import { Table, Row, Card, Col } from "antd";
const { Column } = Table;
class OutlineBasicInfoWritingPolicy extends React.Component {
  state = {
    personal: [],
  };

  render() {
    return (
      <>
        <div
          className="site-layout-background"
          style={{ padding: 24, minHeight: 360 }}
        >
          <Card className="h-50 d-flex flex-column">
            <Table
              sx={{ minWidth: 650 }}
              dataSource={this.props.writingPolicyDataSource}
              align="left"
              pagination={false}
              bordered={true}
              style={{
                marginTop: 10,
                whiteSpace: "pre",
                tableLayout: "fixed",
              }}
              className="ant-table-thead"
            >
              <Column
                title={<b>執筆方針</b>}
                render={(data) => {
                  return (
                    <>
                      <Row>
                        <Col
                          span={6}
                        >
                          タイトル
                        </Col>
                        <Col span={12}>
                          {data.title}
                        </Col>
                      </Row>
                      <Row>
                        <Col
                          span={6}
                        >
                          記事の幅(h2)
                        </Col>
                        <Col span={12}>
                          {data.article_width}
                        </Col>
                      </Row>
                      <Row>
                        <Col
                          span={6}
                        >
                          記事の深さ(h3)
                        </Col>
                        <Col span={12}>
                          {data.article_depth}
                        </Col>
                      </Row>
                      <Row>
                        <Col
                          span={6}
                        >
                          記事の読みやすさ
                        </Col>
                        <Col span={12}>
                          {data.article_readability}
                        </Col>
                      </Row>
                      <Row>
                        <Col
                          span={6}
                        >
                          {" "}
                          CV誘導方法:
                        </Col>
                        <Col span={12}>
                          {data.cv_guidance}
                        </Col>
                      </Row>
                      <Row>
                        <Col
                          span={6}
                        >
                          CV名
                        </Col>
                        <Col span={12}>
                          {data.cv_name}
                        </Col>
                      </Row>
                      <Row>
                        <Col
                          span={6}
                        >
                          {" "}
                          誘導先URL
                        </Col>
                        <Col span={12}>
                          {data.destination_url}
                        </Col>
                      </Row>
                      <Row>
                        <Col
                          span={6}
                        >
                          アイキャッチ画像
                        </Col>
                        <Col span={12}>
                          {data.feature_image}
                        </Col>
                      </Row>
                    </>
                  );
                }}
              />
            </Table>
          </Card>
        </div>
      </>
    );
  }
}

export default OutlineBasicInfoWritingPolicy;
