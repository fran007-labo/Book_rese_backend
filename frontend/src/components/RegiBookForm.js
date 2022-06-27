import React, { useState } from "react";
import {
  Button,
  Grid,
  Box,
  Card,
  CardHeader,
  CardContent,
  Tooltip,
  IconButton,
  Avatar,
  TextField,
  Divider,
} from "@material-ui/core";

import {
  DateRange as DateRangeIcon,
  Room as RoomIcon,
  Business as BusinessIcon,
  GitHub as GitHubIcon,
  Twitter as TwitterIcon,
  Facebook as FacebootIcon,
  Instagram as InstagramIcon,
  Web as WebIcon,
  AddAPhoto as AddAPhotoIcon,
  SentimentVerySatisfied as SentimentVerySatisfiedIcon,
  SentimentSatisfied as SentimentSatisfiedIcon,
  SentimentVeryDissatisfied as SentimentVeryDissatisfiedIcon,
} from "@material-ui/icons";


// styels
import styles from "../styles/RegiBookForm.module.scss";

export default function RegiBookForm() {
  return (
    <div className={styles.root}>
      <form className={styles.form}>
        <Grid container justifyContent="center" alignItems="center" spacing={3}>
          <Grid item xs={11}>
            <Card className={styles.form_card}>
              <CardHeader title="登録フォーム" className={styles.card_header} />
              <Divider />
              <CardContent>
                <Grid
                  container
                  justifyContent="center"
                  alignItems="center"
                  spacing={3}
                >
                  <Grid container spacing={3} item xs={3}>
                    <Grid item xs={12}>
                      <div className={styles.upload_button}>
                        <Tooltip title="add">
                          <IconButton className={styles.icon_button}>
                            <Avatar className={styles.avatar}>
                              <AddAPhotoIcon />
                            </Avatar>
                          </IconButton>
                        </Tooltip>
                      </div>
                    </Grid>
                  </Grid>
                  <Grid container spacing={3} item xs={9}>
                    <Grid item xs={12}>
                      <TextField
                        margin="normal"
                        id="name"
                        label="タイトル"
                        fullWidth
                        className={styles.text_field}
                      />
                      <TextField
                        margin="normal"
                        id="birthplace"
                        label="作者"
                        fullWidth
                        className={styles.text_field}
                      />
                    </Grid>
                  </Grid>
                </Grid>
              </CardContent>
              <Box component="span" m={2} className={styles.button_wrapper}>
                <Button
                  type="submit"
                  variant="contained"
                  color="primary"
                  className={styles.submit_button}
                >
                  SUBMIT
                </Button>
                <Button
                  type="button"
                  variant="contained"
                  color="secondary"
                  onClick={() => null}
                  className={styles.cancel_button}
                >
                  CANCEL
                </Button>
              </Box>
            </Card>
          </Grid>
        </Grid>
      </form>
    </div>
  );
};