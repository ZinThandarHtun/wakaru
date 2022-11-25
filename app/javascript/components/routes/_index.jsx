import React from "react";
import User from "../user/_index";
import Sample from "../sample/_index";

import WritingPolicy from "../writing_policy/_index";
import { Route, Switch } from "react-router-dom";

class Routes extends React.Component {
  render() {
    return (
      <Switch>
        <Route path="/users" component={User}></Route>
        <Route path="/samples" component={Sample}></Route>
        <Route path="/writing_policies" component={WritingPolicy}></Route>
      </Switch>
    );
  }
}

export default Routes;
