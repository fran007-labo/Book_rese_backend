import Paper from '@mui/material/Paper';
import Grid from "@mui/material/Grid"
import Typography from '@mui/material/Typography';
import Box from '@mui/material/Box'
import { AccessTime } from '@mui/icons-material'
import Rating from '@mui/material/Rating';
import { createTheme } from '@mui/material'

const theme = createTheme({
  components: {
    MuiTypography: {
      variants: [
        {
          props: {
            variant: "body2",
          },
          style: { 
            fontSize: 11,
          },
        },
        {
          props: {
            variant: "body3",
          },
          style: { 
            fontSize: 9,
          },
        }
      ]
    }
  }
})


const TourCard = () => {
  return (
    <Grid item xs={3}>
      <Paper elevation={3}>
        <img 
        src="https://peraperabu.com/wp-content/uploads/2019/05/fall01-1-1-1024x476-1.jpg" 
        alt=""
        className="img"
        />
        <Box paddingX={1}>
          <Typography variant="subtitle2" component="h2">
            gersgsgsgs
          </Typography>
          <Box
          sx={{
            display: "flex",
            alignItems: "center",
          }}
          marginTop={1}
          >
            <AccessTime sx={{ width: 12.5 }}/>
            <Typography variant="body2" component="p" marginLeft={0.5}>
              5 hours
            </Typography>
          </Box>
          <Box
            sx={{
              display: "flex",
              alignItems: "center",
            }}
            marginTop={3}
          > 
            <Rating name="size-small" defaultValue={2.5} precision={0.5} size="small" />
            <Typography variant="body2" component="p" marginLeft={0.5}>
              4.5
            </Typography>
            <Typography variant="body3" component="p" marginLeft={1.5}>
              (655 reviews)
            </Typography>
          </Box>
          <Box>
            <Typography variant="h6" component="h3" marginLeft={0}>
              From C $123
            </Typography>
          </Box>
        </Box>
      </Paper>
    </Grid>
  );
};

export default TourCard;