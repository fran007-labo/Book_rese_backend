import React, {useState, useEffect} from 'react';
import axios from 'axios';
import { Grid } from '@material-ui/core'
import { BodyCard } from './index'


const cardContent = { 
  avatarUrl: "https://joeschmoe.io/api/v1/random",
  imageUrl: "https://picsum.photos/150"
}

export default function Centent() {
  const [post, setPosts] = useState([])

  useEffect(() => {
    axios.get('https://jsonplaceholder.typicode.com/posts')
    .then(res => {
        setPosts(res.data)
    })
  }, [])

  const getCardContent = getObj => {
    const bodyCardContent = {...getObj, ...cardContent};
    return (
      <Grid item xs={12} sm={4} key={getObj.id}>
        <BodyCard {...bodyCardContent} />
      </Grid>
    );
  };

  return (
    <Grid container spacing={2}>
      {post.map(contentObj => getCardContent(contentObj))}
    </Grid>
  )
}