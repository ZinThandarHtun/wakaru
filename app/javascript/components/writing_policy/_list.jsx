import React from "react";
import "../../bundles/i18n/ja.js";
import Highlighter from "react-highlight-words";

import { Table, Space, Popconfirm, Input, Button, Tooltip, Card } from "antd";

import {
  EditOutlined,
  DeleteOutlined,
  SearchOutlined,
} from "@ant-design/icons";

class WritingPolicyList extends React.Component {
  state = {
    searchText: "",
    searchedColumn: "",
  };
  getColumnSearchProps = (dataIndex) => ({
    filterDropdown: ({
      setSelectedKeys,
      selectedKeys,
      confirm,
      clearFilters,
    }) => (
      <div style={{ padding: 8 }}>
        <Input
          ref={(node) => {
            this.searchInput = node;
          }}
          placeholder={`Search ${dataIndex}`}
          value={selectedKeys[0]}
          onChange={(e) =>
            setSelectedKeys(e.target.value ? [e.target.value] : [])
          }
          onPressEnter={() =>
            this.handleSearch(selectedKeys, confirm, dataIndex)
          }
          style={{ marginBottom: 8, display: "block" }}
        />
        <Space>
          <Button
            type="primary"
            onClick={() => this.handleSearch(selectedKeys, confirm, dataIndex)}
            icon={<SearchOutlined />}
            size="small"
            style={{ width: 90 }}
          >
            検索
          </Button>
          <Button
            onClick={() => this.handleReset(clearFilters)}
            size="small"
            style={{ width: 90 }}
          >
            リセット
          </Button>
          <Button
            type="link"
            size="small"
            onClick={() => {
              confirm({ closeDropdown: false });
              this.setState({
                searchText: selectedKeys[0],
                searchedColumn: dataIndex,
              });
            }}
          >
            フィルター
          </Button>
        </Space>
      </div>
    ),
    filterIcon: (filtered) => (
      <SearchOutlined style={{ color: filtered ? "#1890ff" : undefined }} />
    ),
    onFilter: (value, record) =>
      record[dataIndex]
        ? record[dataIndex]
            .toString()
            .toLowerCase()
            .includes(value.toLowerCase())
        : "",
    onFilterDropdownVisibleChange: (visible) => {
      if (visible) {
        setTimeout(() => this.searchInput.select(), 100);
      }
    },
    render: (text) =>
      this.state.searchedColumn === dataIndex ? (
        <Highlighter
          highlightStyle={{ backgroundColor: "#ffc069", padding: 0 }}
          searchWords={[this.state.searchText]}
          autoEscape
          textToHighlight={text ? text.toString() : ""}
        />
      ) : (
        text
      ),
  });

  handleSearch = (selectedKeys, confirm, dataIndex) => {
    confirm();
    this.setState({
      searchText: selectedKeys[0],
      searchedColumn: dataIndex,
    });
  };
  handleReset = (clearFilters) => {
    clearFilters();
  };
  columns = [
    {
      title: "番号",
      render: (text, record) => this.props.dataSource.indexOf(record) + 1,
      width: "10%",
      align: "center",
    },
    {
      title: "テンプレート種類",
      dataIndex: "template_type",
      key: "template_type",
      width: "30%",
      sorter: (a, b) => a.template_type.length - b.template_type.length,
      ...this.getColumnSearchProps("template_type"),
    },
    {
      title: "表示順",
      dataIndex: "display_order",
      key: "display_order",
      width: "15%",
      align: "center",
      sorter: (a, b) => a.display_order - b.display_order,
    },
    {
      title: "テンプレート名称",
      dataIndex: "template_name",
      key: "template_name",
      width: "30%",
      ...this.getColumnSearchProps("template_name"),
    },

    {
      title: "操作",
      key: "action",
      align: "center",
      render: (_text, record) => (
        <Space size="middle">
          <a onClick={() => this.props.editStatus(record)}>
            <Tooltip placement="top" title="更新">
              <EditOutlined />
            </Tooltip>
          </a>

          <Popconfirm
            title="削除してもよろしいでしょうか？"
            onConfirm={() => this.props.deleteStatus(record)}
            okText="Yes"
            cancelText="No"
          >
            <a href="#" type="danger">
              <Tooltip placement="top" title="削除">
                <DeleteOutlined />
              </Tooltip>
            </a>
          </Popconfirm>
        </Space>
      ),
    },
  ];
  render() {
    return (
      <>
        <div
          className="site-layout-background"
          style={{ padding: 24, minHeight: 360 }}
        >
          <Card>
            <Table
              align="center"
              bordered
              style={{ marginTop: 10 }}
              className="ant-table-thead"
              headerClassName={this.header}
              dataSource={this.props.dataSource}
              columns={this.columns}
              pagination={{
                pageSize: 10,
                showTotal: (total, range) =>
                  `${total}件の中から${range[0]}から${range[1]}を表示`,
              }}
              total={this.props.dataSource.length}
            />
          </Card>
        </div>
      </>
    );
  }
}
export default WritingPolicyList;
