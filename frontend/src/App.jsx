import React, { useState, useEffect } from 'react';
import Container from '@mui/material/Container';
import UsersList from './components/User/UserList';
import Api from './Api';

const App = () => { 
  const [users, setUsers] = useState([]);

  useEffect(() => {
    const getUser = async () => {
      const response = await Api.get('/users');
      console.log(response.data);
      setUsers(response.data);
    }
    getUser()
  }, [])

  return (
    <Container maxWidth="sm">
      <UsersList />
    </Container>
  );
}

export default App