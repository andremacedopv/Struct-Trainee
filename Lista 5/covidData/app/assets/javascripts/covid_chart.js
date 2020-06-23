$(document).on('turbolinks:load', async function () {

    var ctx = document.getElementById('countryChart').getContext('2d');
    var country_data = await getCountryCovidAPIData ();
    console.log(country_data);
    var pie_chart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Active Cases', 'Deaths', 'Recovered'],
            datasets: [{
                data: getCountryCases(country_data.data),
                backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 199, 132)', 'rgb(55, 99, 132)']
            }]
        }
    });

    var ctx2 = document.getElementById('countriesChart').getContext('2d');
    var countries_data = await getCountriesCovidData();
    console.log(countries_data);
    var analised_countries = await getCountriesByCases(countries_data.data);
    let bar_chart = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: analised_countries[0],
            datasets: [{
                label: 'Number of Covid Cases',
                data: analised_countries[1],
                backgroundColor: CanvasGradient
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

});

function getCountryCovidAPIData (){
    return $.ajax
    ({
        url: "https://covid19-brazil-api.now.sh/api/report/v1/brazil",
        dataType: "json",
        success: function (result) {
            console.log("API Loaded");
        },
        error: function () {
            console.log("API Error");
        }
    });
}

function getCountriesCovidData (){
    return $.ajax
    ({
        url: "https://covid19-brazil-api.now.sh/api/report/v1/countries",
        dataType: "json",
        success: function (result) {
            console.log("API Loaded");
        },
        error: function () {
            console.log("API Error");
        }
    });
}

function getCountryCases (json_data){
    var data = [];
    data.push(json_data.cases);
    data.push(json_data.deaths);
    data.push(json_data.recovered);
    return data;
}

async function getCountriesByCases (json_data) {
    const number_of_countries = 5;
    var sorted_countries = json_data.sort(SortBy("confirmed"));
    console.log(sorted_countries);
    var countries_names = [], confirmed_cases = [];
    for (var i = 0; i <= number_of_countries; i++){
        countries_names.push(sorted_countries[i].country);
        confirmed_cases.push(sorted_countries[i].confirmed);
    }
    var countries = [];
    countries.push(countries_names);
    countries.push(confirmed_cases);
    console.log(countries);
    return countries; 
}

function SortBy(prop) {
    return function(a, b) {
        if (a[prop] > b[prop]){
            return -1;
        }
        else if (a[prop] < b[prop]){
            return 1;
        }
        return 0;
    }
}