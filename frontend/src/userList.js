import React, { Component } from "react"

const api_url = `http://localhost:8000/api/v1/users`

class UserList extends Component {
  constructor(props) {
    super(props)

    this.state = {
      users: []
    }
  }

  render() {
    return (
			<div></div>
		)
	}
}

export default UserList;