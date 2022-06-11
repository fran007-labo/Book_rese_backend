import React from 'react';
import { Header, Content, About, PostContent } from './components/index';
import Grid from '@material-ui/core/Grid';

import {
  BrowserRouter,
  Routes,
  Route
} from "react-router-dom";

export default function App() {
  return (
    <div className="App">
      <Grid container direction="column">
        <Grid item>
          <Header />
        </Grid>
        <Grid item container>
          <Grid item sm={2} />
          <Grid item xs={12} sm={8}>
            {/* <Content /> */}
            <BrowserRouter>
              <Routes>
                <Route path={"/"} 
                  element={<Content />} 
                />
                <Route path={"/about"} 
                  element={<About />} 
                />
                <Route path={"/post/:id"} 
                  element={<PostContent />} 
                />
              </Routes>
            </ BrowserRouter>
          </Grid>
          <Grid item sm={2} />
        </Grid>
      </Grid>
    </div>
  )
}
