import React from "react";
import "../../bundles/i18n/ja.js";
import WritingPolicyList from "./_list.jsx";
import WritingPolicyEntry from "./_entry.jsx";

import { message } from "antd";

class WritingPolicy extends React.Component {
  state = {
    writing_policies: [],
    template_types: [],
    edit_status: false,
    template_type: "",
    display_order: "",
    template_name: "",
    template_description: "",
    message: "",
    message_type: "",
    m_visible: false,
    template_type_id: 0,
  };

  loadWritingPolicy = () => {
    const url = "/api/v1/writing_policy/firstLoad";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        if (data.errStatus == 1) {
          this.setState({
            message: data.message,
            message_type: data.messageType,
            m_visible: true,
          });
        } else {
          data.writing_policies.forEach((writing_policy) => {
            const newNl = {
              key: writing_policy.id,
              id: writing_policy.id,
              template_type: writing_policy.template_type,
              display_order: writing_policy.display_order,
              template_name: writing_policy.template_name,
              template_description: writing_policy.template_description,
            };

            this.setState((prevState) => ({
              writing_policies: [...prevState.writing_policies, newNl],
            }));
          });
          this.setState({ template_types: data.template_types });
        }
      })
      .catch((err) => message.error("Error: " + err));
  };

  componentDidMount() {
    this.loadWritingPolicy();
  }

  createWritingPolicy = (values, enterForm) => {
    const url = "/api/v1/writing_policy/firstLoad";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        let templateTypeId = data.writing_policies.filter(
          (templateTypeId) =>
            templateTypeId.template_type_id == values.template_type_id &&
            templateTypeId.display_order == values.display_order
        );
        let temName = data.writing_policies.filter(
          (temName) => temName.template_name == values.template_name
        );
        if (templateTypeId.length > 0) {
          this.setState({
            message: "?????????????????????????????????????????????",
            message_type: "error",
            m_visible: true,
          });
        } else {
          if (Object.keys(temName).length == 1) {
            this.setState({
              message: "????????????????????????????????????????????????????????????",
              message_type: "error",
              m_visible: true,
            });
          } else {
            let template_type_id = values.template_type_id;
            console.log(template_type_id);
            fetch(`http://localhost:3000/api/v1/writing_policy/create`, {
              method: "POST",

              headers: {
                "Content-Type": "application/json",
              },

              body: JSON.stringify({
                template_type_id: values.template_type_id,
                display_order: parseInt(values.display_order),
                template_name: values.template_name,
                template_description: values.template_description,
              }),
            })
              .then((data) => {
                if (data.ok) {
                  return data.json();
                }
              })
              .then((data) => {
                if (data.errStatus == 1) {
                  console.log("errStatus", data.errStatus);
                  this.setState({
                    message: data.message,
                    message_type: data.messageType,
                    m_visible: true,
                  });
                } else {
                  this.setState({
                    message: "?????????????????????",
                    message_type: "success",
                    m_visible: true,
                  });
                  const { template_types } = this.state;
                  const template_Type = template_types.find(
                    (item) => item.id == data.template_type_id
                  );

                  const newEl = {
                    key: data.id,
                    id: data.id,
                    template_type: template_Type.template_type,
                    display_order: data.display_order,
                    template_name: data.template_name,
                    template_description: data.template_description,
                  };

                  this.setState((prevState) => ({
                    writing_policies: [...prevState.writing_policies, newEl],
                  }));
                }
              });
            enterForm.current.resetFields();
          }
        }
      });
  };
  deleteStatus = (deleteAllData) => {
    fetch(
      `http://localhost:3000/api/v1/writing_policy/destroy/${deleteAllData.id}`,
      {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
      }
    )
      .then((data) => {
        if (data.ok) {
          this.deleteWritingPolicy(deleteAllData.id);
          return data.json();
        }
      })
      .then((data) => {
        if (data.errStatus == 1) {
          this.setState({
            message: data.message,
            message_type: data.messageType,
            m_visible: true,
          });
        } else {
          this.setState({
            message: "?????????????????????",
            message_type: "success",
            m_visible: true,
          });
        }
      });
  };

  deleteWritingPolicy(id) {
    let new_writing_policies = this.state.writing_policies.filter(
      (writing_policy) => writing_policy.id !== id
    );
    this.setState({
      writing_policies: new_writing_policies,
    });
  }

  editStatus = (record) => {
    let id = record.id;
    fetch(
      `http://localhost:3000/api/v1/writing_policy/writing_policies_id_find/${id}`,
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      }
    )
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        if (data.errStatus == "Ok") {
          let templateId = this.state.template_types.filter(
            (i) => i.template_type == record.template_type
          );
          this.setState({
            edit_status: true,
            id: record.id,
            template_type_id: templateId[0].id,
            template_type: record.template_type,
            display_order: record.display_order,
            template_name: record.template_name,
            template_description: record.template_description,
          });
        } else {
          this.setState({
            message: data.message,
            message_type: data.messageType,
            m_visible: true,
          });
        }
      });
  };

  editWritingPolicy(id, itemAttributes) {
    var index = this.state.writing_policies.findIndex((x) => x.id === id);
    this.setState({
      writing_policies: [
        ...this.state.writing_policies.slice(0, index),

        Object.assign({}, this.state.writing_policies[index], itemAttributes),

        ...this.state.writing_policies.slice(index + 1),
      ],
    });
  }

  updateWritingPolicy = (values, enterForm) => {
    let id = values.writing_policy_id;

    fetch(`http://localhost:3000/api/v1/writing_policy/update/${id}`, {
      method: "PUT",

      headers: {
        "Content-Type": "application/json",
      },

      body: JSON.stringify({
        template_type_id: values.template_type_id,
        display_order: parseInt(values.display_order),
        template_name: values.template_name,
        template_description: values.template_description,
      }),
    })
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
      })
      .then((data) => {
        if (data.errStatus == 1) {
          this.setState({
            message: data.message,
            message_type: data.messageType,
            m_visible: true,
          });
        } else {
          this.setState({
            message: "?????????????????????",
            message_type: "success",
            m_visible: true,
          });
          let ItemsCopy = [];

          this.state.writing_policies.map((entry) => {
            if (entry.id == data.id) {
              const { template_types } = this.state;
              let template_Type = template_types.find(
                (item) => item.id == data.template_type_id
              );
              entry.template_type = template_Type.template_type;
              entry.display_order = data.display_order;
              entry.template_name = data.template_name;
            }

            ItemsCopy.push(entry);
          });

          this.setState({ writing_policies: ItemsCopy });

          this.editWritingPolicy(data.id, data);
        }
        this.state.edit_status = false;
      });
    enterForm.current.resetFields();
  };

  writingPolicy = (values, enterForm) => {
    let new_writing_policies = this.state.writing_policies.filter(
      (writing_policy) => writing_policy.id !== values.writing_policy_id
    );
    if (this.state.edit_status) {
      let templateTypeId = new_writing_policies.filter(
        (templateTypeId) =>
          templateTypeId.template_type_id == values.template_type_id &&
          templateTypeId.display_order == values.display_order
      );
      let temName = new_writing_policies.filter(
        (temName) => temName.template_name == values.template_name
      );
      if (templateTypeId.length > 0) {
        this.setState({
          message: "?????????????????????????????????????????????",
          message_type: "error",
          m_visible: true,
        });
      } else if (Object.keys(temName).length == 1) {
        this.setState({
          message: "????????????????????????????????????????????????????????????",
          message_type: "error",
          m_visible: true,
        });
      } else {
        this.updateWritingPolicy(values, enterForm);
        this.state.edit_status = false;
      }
    } else {
      this.createWritingPolicy(values, enterForm);
    }
  };

  handleClose = () => {
    this.setState({ m_visible: false });
  };
  excel = () => {};
  preview = () => {};
  render() {
    return (
      <>
        <WritingPolicyEntry
          template_types={this.state.template_types}
          edit_status={this.state.edit_status}
          id={this.state.id}
          template_type_id={this.state.template_type_id}
          template_type={this.state.template_type}
          display_order={this.state.display_order}
          template_name={this.state.template_name}
          template_description={this.state.template_description}
          message={this.state.message}
          message_type={this.state.message_type}
          m_visible={this.state.m_visible}
          messageAlertClose={this.handleClose}
          writingPolicy={this.writingPolicy}
        />
        <WritingPolicyList
          dataSource={this.state.writing_policies}
          editStatus={this.editStatus}
          deleteStatus={this.deleteStatus}
        />
      </>
    );
  }
}
export default WritingPolicy;
