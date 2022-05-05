import React from 'react';
import axios from 'axios';
// import API from '../api';

export default class UserList extends React.Component {
  constructor(props){ 
    super(props)
    this.state = {
      users: []
    }
  }

  componentDidMount() {
    axios.get(`http://localhost:8000/api/v1/users`)
    .then(res => {
      const users = res.data;
      this.setState({ users });
    })
  }

  render() {
    return (
      <ul>
        { this.state.users.map(user => <li>{user.name}</li>)}
      </ul>
    )
  }
}