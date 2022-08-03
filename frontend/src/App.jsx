import React from 'react';
import { BooksIndex } from './components/Index';
import Grid from '@material-ui/core/Grid';


export default function App() {
  return (
    <div className="App">
      <Grid item container>
        <Grid item sm={2} />
        <Grid item xs={12} sm={8}>
          <BooksIndex />
        </Grid>
        <Grid item sm={2} />
      </Grid>
    </div>
  )
}
