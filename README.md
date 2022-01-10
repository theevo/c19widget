# COVID-19 Widget

## ToDo

- `.onAppear` doesn't seem to trigger after even 30 minutes after being in the background. what will work?


## Overview

Display a 7-day graph of cases in your country.

## API

[https://covid19api.com](covid19api.com) is sourced from [Johns Hopkins CSSE](https://github.com/CSSEGISandData/COVID-19) 

## Data Quirks

### API is recording data 1 day late

I was able to to match confirmed cases against [health.data.ny.gov](https://health.data.ny.gov/Health/New-York-State-Statewide-COVID-19-Testing/xdss-u53e/data), and this gives me confidence in the numbers Covid19Api is reporting.

However, there is just a little quirk.

Let's say New York county records their cumulative confirmed cases as 297040 on 1/3/2022. Covid19Api displays this number with a date of 1/4/2022.

The possible explaination for this is the API's bots are scheduled to scrape the data *after* the state agency publishes its data. New York state has a cutoff time (2pm), Harris County in Texas calls it "reported by" time (10am). It's probably chaotic given all the various data sources it's trying to aggregate. It makes sense Covid19Api would have all of the data published on 1/3 ready to serve on their API by midnight 1/4.

Covid19Api does not publish "today's" numbers. All attempts to request today's numbers from the API just don't show up at all. So it's safe to say they will be published tomorrow.

Given these facts, I'm debating over whether I should bump the dates forward by one day. It wouldn't be inaccurate to do so. 

### Cannot validate Texas counts

I tried to match the numbers in Harris county and Travis county.

Are they in the same ballpark? It's off by over 1.6%, if we use the 1-day delay we learned about from New York.

Here's Harris County...

| Date | C19API | 
| ------------- | ------------- |
| 2022-01-01  | 651970 |
| 2022-01-02  | 654648 |
| 2022-01-03  | 691020 |
| 2022-01-04  | 700621 |


| Date | [Texas DSHS](https://dshs.texas.gov/coronavirus/TexasCOVID19DailyCountyCaseCountData.xlsx) |
| ------------- | ------------- |
| 2022-01-01  | 656151  |
| 2022-01-02  | 668654  |
| 2022-01-03  | 680426  |
| 2022-01-04  | 688986  |
| 2022-01-05  | 698124 |

[Harris County](https://covid-harriscounty.hub.arcgis.com/pages/cumulative-data) doesn't publish all of their numbers historical numbers. For reasons unknown, their [Reported COVID Cases Timeline](https://covid-harriscounty.hub.arcgis.com/datasets/40256f837cd344d787b0414255b4f529_0/explore) drops off a cliff after 8/9/2021. So they won't give us this week's numbers; they only show today's.

What's even more mindboggling is their numbers don't line up with the state's. On their [dashboard](https://covid-harriscounty.hub.arcgis.com/pages/cumulative-data), they say confirmed cases on 2022-1-5 is 667263. The state of Texas is reporting a number that is over 4.6% higher. Whose number is right? Why the discrepancy?

And most importantly, where the hell is C19API pulling their data from?

*They say everything's bigger in Texas...*

## Swift Resources

### Bar Graphs in SwiftUI

[https://blckbirds.com/post/charts-in-swiftui-part-1-bar-chart/](https://blckbirds.com/post/charts-in-swiftui-part-1-bar-chart/)

[https://swdevnotes.com/swift/2021/how-to-create-bar-chart-swiftui/](https://swdevnotes.com/swift/2021/how-to-create-bar-chart-swiftui/)

