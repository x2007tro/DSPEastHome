# DSPEastHome
Data science practitioners east official website (https://dspeast.shinyapps.io/dspeasthome/)

## To update website contents
* Website event content is controlled by ./input/event.xlsx
* Tab 'Layout Design' contains the website design information
* Tab 'Layout Mapping' contains how the spreadsheet is linked to the website
* To add a new event, add a new row to the table within tab 'Event Info' with the field 'active' set to 1
  * Only active events will be loaded into the website, however, only one event will be used
  * If more than one active events exist, the one in the last row will be used
  * If no active event exists, error will occur
* To add a new event schedule, add a new row to the table within tab 'Event Schedule' 
  * Event and schedule are linked through 'event_id'
  * If no matching schedule is found, event will still be valid but schedule section will be blank

## To deploy the website through RStudio IDE
* Refer to https://www.shinyapps.io/

## Potential future improvements
* Develop the 'About us' panel