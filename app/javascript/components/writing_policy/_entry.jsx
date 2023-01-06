import React from "react";
import I18n from "i18n-js";
import "../../bundles/i18n/ja.js";

import {
  Form,
  Input,
  Button,
  Select,
  Card,
  InputNumber,
  Alert,
  Row,
  Col,
} from "antd";
const layout = {
  labelCol: { span: 8 },
  wrapperCol: { span: 12 },
};

class WritingPolicyEntry extends React.Component {
  formRef = React.createRef();
  state = {
    template_types: [],
    template_types_id: [],
    visible: true,
  };
  onFinish = (values) => {
    this.props.writingPolicy(values, this.formRef);
  };

  render() {
    if (this.props.edit_status == true) {
      let writing_policy_id = this.props.id;
      let display_order = this.props.display_order;
      let template_name = this.props.template_name;
      let template_description = this.props.template_description;
      let template_type_id = this.props.template_type_id;

      this.formRef.current.setFieldsValue({
        writing_policy_id: writing_policy_id,
        template_type_id: template_type_id,
        display_order: display_order,
        template_name: template_name,
        template_description: template_description,
      });
    }
    return (
      <>
        <div
          className="site-layout-background"
          style={{ padding: 24, minHeight: 360 }}
        >
          <Card>
            <Row>
              <Col span={12} offset={6}>
                {this.props.m_visible && (
                  <Alert
                    message={this.props.message}
                    type={this.props.message_type}
                    closable
                    afterClose={this.props.messageAlertClose}
                  />
                )}
              </Col>
            </Row>
            <br />

            <Form {...layout} onFinish={this.onFinish} ref={this.formRef}>
              <Form.Item
                name="template_type_id"
                label="テンプレート種類"
                rules={[
                  {
                    required: true,
                    message: "テンプレート種類を選択してください。",
                  },
                ]}
              >
                <Select>
                  <Select.Option Selected value="">
                    テンプレート種類を選択してください
                  </Select.Option>
                  {this.props.template_types.map((template_type) => (
                    <Select.Option
                      value={template_type.id}
                      key={template_type.id}
                    >
                      {template_type.template_type}
                    </Select.Option>
                  ))}
                </Select>
              </Form.Item>
              <Form.Item
                name="display_order"
                label="表示順"
                rules={[{ required: true, message: I18n.t("message.M013") }]}
              >
                <InputNumber
                  min={1}
                  maxLength={10}
                  style={{
                    width: "100%",
                  }}
                />
              </Form.Item>
              <Form.Item
                name="template_name"
                label="テンプレート名称"
                rules={[
                  {
                    required: true,
                    message: "テンプレート名称を入力してください。",
                  },
                ]}
              >
                <Input maxLength={255} />
              </Form.Item>
              <Form.Item
                name="template_description"
                label="テンプレート内容"
                rules={[
                  {
                    required: true,
                    message: "テンプレート内容を入力してください。",
                  },
                ]}
              >
                <Input.TextArea maxLength={255} />
              </Form.Item>

              <Form.Item wrapperCol={{ ...layout.wrapperCol, offset: 8 }}>
                <Button type="primary" htmlType="submit">
                  保存
                </Button>
              </Form.Item>
              <Form.Item name="writing_policy_id" hidden={true}>
                <Input />
              </Form.Item>
            </Form>
          </Card>
        </div>
      </>
    );
  }
}
export default WritingPolicyEntry;
