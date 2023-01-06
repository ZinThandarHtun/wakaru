import React from "react";
import "../../bundles/i18n/ja.js";
import { Table } from "antd";
import Column from "antd/lib/table/Column.js";
class Comflit extends React.Component {
  state = {
    detail: [],
    siteInfo: [],
    headerClassificationDict: [],
    conflictData: [],
    conflictDataList: [],
  };

  onChange = (key) => {
    console.log(key);
  };
  render() {
    let { conflictData } = this.props;
    return (
      <>
        <div className="scroll">
          {conflictData.map((conflictDataList, index) => (
            <div
              key={index}
              style={{
                width: "100%",
                marginRight: "40px",
              }}
            >
              <div className="text">{conflictDataList.siteTitle}</div>
              <div className="text">{conflictDataList.siteUrl}</div>
              <br></br>
              <Table
                className="conflict-list-table"
                tableLayout="fixed"
                dataSource={conflictDataList.conflictData}
                bordered={true}
                pagination={false}
              >
                <Column
                  title="タグ"
                  width="10%"
                  dataIndex="tag"
                  key="tag"
                  render={(text, record) => {
                    if (record.tag == "h3")
                      return (
                        <div style={{ textAlign: "center" }}>{record.tag} </div>
                      );
                    else
                      return (
                        <div style={{ textAlign: "left" }}>{record.tag} </div>
                      );
                  }}
                />
                <Column
                  title="1記事目見出し"
                  width="20%"
                  dataIndex="articleHeadline"
                  key="articleHeadline"
                />
                <Column
                  title="分類項目"
                  width="30%"
                  dataIndex="classificationItem"
                  key="classificationItem"
                />
              </Table>
            </div>
          ))}
        </div>
      </>
    );
  }
}

export default Comflit;
