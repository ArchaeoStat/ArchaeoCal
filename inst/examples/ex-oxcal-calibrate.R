\dontrun{
## Download OxCal
oxcal_configure()

## Calibrate 14C dates
cal <- oxcal_calibrate(
  names = c("X","Y"),
  dates = c(5000, 4500),
  errors = c(45, 35)
)

plot(cal)
}
