/*************** AUTO GENERATED BY REMOTE CONTROL MODULE ***************/

var config = 
{
  address: '0.0.0.0',
  electronOptions: {},
  ipWhitelist: [],
  language: 'de',
  timeFormat: 24,
  units: "metric",
  modules: [
    {
      module: 'alert',
      config: {}
    },
    {
      module: 'MMM-Remote-Control',
      position: 'top_bar',
      header: '',
      config: {
        customCommand: {}
      }
    },
    {
      module: 'MMM-Remote-Control-Repository',
      header: '',
      config: {}
    },
    {
      module: 'updatenotification',
      position: 'top_bar',
      header: '',
      config: {
        updateInterval: 3600000,
        ignoreModules: []
      }
    },
    /*{
      module: 'MMM-pages',
      header: '',
      config: {
        modules: [
          [
            'newsfeed',
            'compliments',
            'MMM-HTMLBox'
          ],
          [
            'calendar',
            //'weather'
          ]
        ],
        excludes: [
          'clock',
          'weather',
          'MMM-page-indicator'
        ],
        rotationTime: 10000,
        fixed: [
          'MMM-page-indicator'
        ]
      }
    },
    {
      module: 'MMM-page-indicator',
      position: 'bottom_bar',
      header: '',
      config: {}
    },*/
    {
      module: 'clock',
      position: 'top_left',
      header: '',
      config: {
        showSunTimes: true,
        showMoonTimes: true,
	timezone: 'Europe/Vienna',
        lat: 47.262691,
	lon: 11.394700,
        clockBold: false
      }
    },
    /*{
      module: 'calendar',
      position: 'top_left',
      header: '',
      config: {
        maximumNumberOfDays: '7',
        calendars: [
          {
            symbol: 'calendar-star',
            url: 'https://calendar.google.com/calendar/ical/m.waldegger%40gmail.com/private-1ece4391adaa100bf361f6f51855842b/basic.ics'
          },
          {
            symbol: 'calendar-check',
            url: 'https://calendar.google.com/calendar/ical/mru4au307chi0ergmdars1ta3k%40group.calendar.google.com/private-5c343277363954dd9813a3f449b78e53/basic.ics'
          }
        ],
        titleReplace: {
          'De verjaardag van ': '',
          "'s birthday": ''
        },
        excludedEvents: [],
        fetchInterval: 599999,
        animationSpeed: 5000,
        locationTitleReplace: {
          'street ': ''
        }
      }
    },*/
    {
      module: 'compliments',
      position: 'lower_third',
      config: {
        compliments: {
          anytime: [
            'Hey there sexy!'
          ],
          morning: [
            'Good morning, handsome!',
            'Enjoy your day!',
            'How was your sleep?'
          ],
          afternoon: [
            'Hello, beauty!',
            'You look sexy!',
            'Looking good today!'
          ],
          evening: [
            'Wow, you look hot!',
            'You look nice!',
            'Hi, sexy!'
          ]
        }
      }
    },
    {
      module: 'weather',
      position: 'top_right',
      header: '',
      config: {
	type: "current",
        location: "Innsbruck, AT",
        apiKey: "80dd89bbe85519f11399f10d0ca3bdbf"
      }
    },
    {
      module: 'weather',
      position: 'top_right',
      header: '',
      config: {
	weatherProvider: 'openweathermap',
 	type: 'forecast',
        location: 'Innsbruck',
        locationID: '2775220',
        apiKey: '80dd89bbe85519f11399f10d0ca3bdbf',
        maxNumberOfDays: 4,
        showRainAmount: true
      }
    },
    {
      module: 'newsfeed',
      position: 'bottom_bar',
      header: '',
      config: {
        feeds: [
          {
            title: 'New York Times',
            url: 'http://www.nytimes.com/services/xml/rss/nyt/HomePage.xml'
          },
          {
            title: 'Standard.at',
            url: 'http://derStandard.at/?page=rss&ressort=Seite1'
          },
          {
            title: 'TT',
            url: 'https://www.tt.com/rss/news.xml'
          }
        ],
        startTags: [],
        endTags: [],
        prohibitedWords: [],
        reloadInterval: 599996
      }
    }
  ],
  paths: {
    modules: 'modules',
    vendor: 'vendor'
  }
}

/*************** DO NOT EDIT THE LINE BELOW ***************/
if (typeof module !== 'undefined') {module.exports = config;}