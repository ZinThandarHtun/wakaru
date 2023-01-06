import React from "react";
import "../../bundles/i18n/ja.js";
import { Table, Row, Card, Col } from "antd";
import {
  ExcelExport,
  ExcelExportColumn,
} from "@progress/kendo-react-excel-export";
const { Column } = Table;
class Personal extends React.Component {
  state = {
    personal: [],
  };

  render() {
    const _exporter = React.createRef();
    const excelExport = () => {
      if (_exporter.current) {
        _exporter.current.save();
      }
    };
    return (
      <>
        <div
          className="site-layout-background"
          style={{ padding: 24, minHeight: 360 }}
        >
          <Card className="h-50 d-flex flex-column">
            <Table
              dataSource={this.props.personalDataSource}
              align="left"
              style={{ tableLayout: "auto" }}
              pagination={false}
            >
              <Column
                title={"ペルソナ入力"}
                render={(data) => {
                  return (
                    <>
                      <Row>
                        <Col span={6}>ユーザー属性</Col>
                        <Col span={12}>{data.user_attribute}</Col>
                      </Row>
                      <Row>
                        <Col span={6}>検索する状況</Col>
                        <Col span={12}>{data.search_condition}</Col>
                      </Row>
                    </>
                  );
                }}
              />
            </Table>
          </Card>
        </div>
        <button
          className="k-button k-button-md k-rounded-md k-button-solid k-button-solid-base"
          onClick={excelExport}
        >
          Export to Excel
        </button>
        <ExcelExport
          data={this.props.personalDataSource}
          fileName="Preview.xlsx"
          ref={_exporter}
        >
          <ExcelExportColumn
            field="user_attribute"
            title="ユーザー属性"
            headerCellOptions={{
              background: "#ff0000",
              textAlign: "center",
            }}
          />
          <ExcelExportColumn
            field="search_condition"
            title="検索する状況"
            width={350}
          />
        </ExcelExport>
        
      </>
    );
  }
}

export default Personal;
