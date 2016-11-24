$(document).ready(function() {
    $.get("/stories.json", function(stories) {
        var ctx = document.getElementById("burn-up-chart");
        if (!ctx) {
            return;
        }
        var estimated_points = [];

        var getPoints = function(stories, dateName) {
            var estimated_points = [];
            var sortedDailyStories = _.chain(stories)
                .groupBy(function(s) { return s[dateName] })
                .map(function(stories, date) {
                    return { date: date, stories: stories }
                })
                .sortBy(function(dailyStories) {
                    return dailyStories.date
                }).value();

            var total = 0;
            _.each(sortedDailyStories, function(dailyStories) {
                var points = _.reduce(dailyStories.stories, function(memo, story) { return memo + story.estimated_points }, 0)
                total += points;
                estimated_points.push({ x: dailyStories.date, y: total })
            });
            var lastStory = estimated_points[estimated_points.length - 1];
            if (lastStory.date != moment()) {
                estimated_points.push({ x: moment(), y: lastStory.y })
            }

            return estimated_points;
        }
        var estimated_points = getPoints(stories, 'planned_on');
        var real_points = getPoints(stories, 'dev_done_on');

        var data = {
            datasets: [{
                    label: 'Estimated',
                    data: estimated_points,
                    borderColor: "rgba(255,128,0,1)"
                },
                {
                    label: 'Real',
                    data: real_points,
                    borderColor: "rgba(0,155,0,1)"
                }
            ]
        };
        var chartInstance = new Chart(ctx, {
            type: 'line',
            data: data,
            options: {
                scales: {
                    xAxes: [{
                        type: 'time',
                        time: {
                            unit: 'day',
                            min: moment(estimated_points[0].x).add(-1, "d"),
                            max: moment().add(2, "d")
                        },
                    }]
                }
            }
        });
    })

})