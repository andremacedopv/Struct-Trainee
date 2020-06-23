async function eventCalendar() {
    let holidays = await getHolidays();
    return $('#event_calendar').fullCalendar({
        events: JSONtoEvents(holidays)
    });
};

function getHolidays(){
    return $.ajax
    ({
        url: "https://api.calendario.com.br/?json=true&ano=2020&ibge=3550308&token=YW5kcmVtYWNlZG8ucHZAZ21haWwuY29tJmhhc2g9OTIxMTU2MTA",
        dataType: "json",
        success: function (result) {
            console.log("API Loaded");
        },
        error: function () {
            console.log("Calendar API Error");
        }
    });
}

function JSONtoEvents(json_text){
    let events = []
    for (var i = 0; i < json_text.length; i++){
        let [day, month, year] = json_text[i].date.split('/');
        let date = year + "-" + month + "-" + day;
        console.log(date);
        events.push({
            id: i,
            title: json_text[i].name,
            start: date,
            url: json_text[i].link,
        })
    }
    return events
}

function clearCalendar() {
    $('#event_calendar').fullCalendar('delete'); // In case delete doesn't work.
    $('#event_calendar').html('');
};

$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar)