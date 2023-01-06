import React from "react";
import I18n from "i18n-js";
import "../../bundles/i18n/ja.js";

import {
  Table,
  Space,
  Popconfirm,
  message,
  Form,
  Input,
  Button,
  Layout,
  Select,
  Content,
  Card,
} from "antd";
import { EditOutlined, DeleteOutlined } from "@ant-design/icons";
 const layout = {
   labelCol: { span: 8 },
   wrapperCol: { span: 12 },
 };
class User extends React.Component {
  state = {
    users: [],
  };
  columns = [
    {
      title: I18n.t("user.id"),
      dataIndex: "id",
      key: "id",
      sorter: (a, b) => a.id - b.id,
    },
    {
      title: I18n.t("user.user_name"),
      dataIndex: "user_name",
      key: "user_name",
      width: "40%",
      sorter: (a, b) => a.user_name.length - b.user_name.length,
      //  ...this.getColumnSearchProps("user_name"),
    },
    {
      title: I18n.t("user.user_name_last"),
      dataIndex: "user_name_last",
      key: "user_name_last",
      width: "40%",
      sorter: (a, b) => a.user_name_last.length - b.user_name_last.length,
      //  ...this.getColumnSearchProps("user_name_last"),
    },
    {
      title: I18n.t("user.action"),
      key: "action",
      render: (_text, record) => (
        <Space size="middle">
          <a onClick={() => this.editStatus(record)}>
            <EditOutlined />
          </a>
          <Popconfirm
            title="削除してもよろしいでしょうか？"
            onConfirm={() => this.deleteStatus(record)}
            okText="Yes"
            cancelText="No"
          >
            <a href="#" type="danger">
              <DeleteOutlined />{" "}
            </a>
          </Popconfirm>
        </Space>
      ),
    },
  ];
  loadUsers = () => {
    const url = "/api/v1/user/index";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
        throw new Error("Network error.");
      })
      .then((data) => {
        data.forEach((user) => {
          const newNl = {
            key: user.id,
            id: user.id,
            user_name: user.user_name,
            user_name_last: user.user_name_last,
          };

          this.setState((prevState) => ({
            users: [...prevState.users, newNl],
          }));
        });
      })
      .catch((err) => message.error("Error: " + err));
  };

  componentDidMount() {
    this.loadUsers();
  }
  render() {
    return (
      <>
        {/* <Layout style={{ minHeight: "100vh" }}> */}
          {/* <Content style={{ margin: "0 16px" }}>
          <Space direction="vertical" style={{ width: "100%" }}>
              <Card> */}
          <Form {...layout}>
            <Form.Item
              name="type"
              label="テンプレート種類"
              rules={[{ required: true }]}
            >
              <Select
                // placeholder="Select a option and change input text above"
                onChange={this.onGenderChange}
                allowClear
              >
                <Option value="male">male</Option>
                <Option value="female">female</Option>
                <Option value="other">other</Option>
              </Select>
            </Form.Item>
            <Form.Item
              name="number"
              label="表示順"
              rules={[{ required: true }]}
            >
              <Input />
            </Form.Item>
            <Form.Item
              name="name"
              label="テンプレート名称"
              rules={[{ required: true }]}
            >
              <Input />
            </Form.Item>
            <Form.Item
              name="detail"
              label="テンプレート内容"
              rules={[{ required: true }]}
            >
              <Input.TextArea />
            </Form.Item>

            <Form.Item wrapperCol={{ ...layout.wrapperCol, offset: 8 }}>
              <Button type="primary">保存</Button>
            </Form.Item>
          </Form>
          {/* </Card>
            </Space>
          </Content> */}
        {/* </Layout> */}

        <div
          className="site-layout-background"
          style={{ padding: 24, minHeight: 360 }}
        >
          <Table
            className="table-striped-rows"
            dataSource={this.state.users}
            columns={this.columns}
            pagination={{ pageSize: 5 }}
          />
        </div>
      </>
    );
  }
}

export default User;
