import React from 'react';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import Divider from '@mui/material/Divider';
import ListItemText from '@mui/material/ListItemText';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import Avatar from '@mui/material/Avatar';
import Typography from '@mui/material/Typography';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';

const users = [
  {
    id: 1,
    name: "title1"
  },
  {
    id: 2,
    name: "title2"
  },
  {
    id: 3,
    name: "title3"
  },
  {
    id: 4,
    name: "title4"
  },
];
const UsersList = () => {
  // {users.map((user, index) => {
    return (
      <React.Fragment>
        <Box
            sx={{
              display: 'flex',
              justifyContent: 'flex-end',
              p: 1,
              m: 1,
              borderRadius: 1,
            }}
          >
          <Button variant="contained">Contained</Button>
        </Box>
        <List sx={{ width: '100%', bgcolor: 'background.paper' }}>
          <ListItem alignItems="flex-start">
            <ListItemAvatar>
              <Avatar alt="Remy Sharp" src="/static/images/avatar/1.jpg" />
            </ListItemAvatar>
            <ListItemText
              primary='jfgslk'
              secondary={
                <React.Fragment>
                  <Typography
                    sx={{ display: 'inline' }}
                    component="span"
                    variant="body2"
                    color="text.primary"
                  >
                    Ali Connors
                  </Typography>
                  {" — I'll be in your neighborhood doing errands this…"}
                </React.Fragment>
              }
            />
          </ListItem>
          <Divider variant="inset" component="li" />
        </List>
      </React.Fragment>
    );
  // })}
}

export default UsersList

