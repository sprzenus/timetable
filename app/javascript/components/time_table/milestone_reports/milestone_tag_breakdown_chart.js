import _ from 'lodash';
import Chart from 'chart.js';
import React, { useState, useEffect, useRef } from 'react';
import { tagColors } from '../../shared/constants';
import { formattedDuration } from '../../shared/helpers';

function MilestoneTagBreakdownChart(props) {
  const { workTimes, workTimesSumByTag } = props;
  const chartRef = useRef(null);
  const [chart, setChart] = useState(null);

  function updateChartWithData() {
    if (chart) {
      const dates = Object.keys(_.groupBy(workTimes, 'date'));

      const datasets = Object.keys(tagColors).map((tag) => {
        const data = dates.map((date) => (_.chain(workTimes).filter({ date, tag }).sumBy('duration').value()));
        return {
          label: tag,
          backgroundColor: tagColors[tag],
          data,
        };
      });

      chart.config.data = {
        datasets,
        labels: dates,
      };

      chart.update();
    }
  }

  useEffect(() => {
    if (chartRef && chartRef.current) {
      const newChartInstance = new Chart(chartRef.current.getContext('2d'), {
        type: 'bar',
        options: {
          legend: { display: false },
          responsive: true,
          scales: {
            xAxes: [{
              stacked: true,
            }],
            yAxes: [{
              display: false,
              stacked: true,
            }],
          },
          tooltips: {
            callbacks: {
              label(tooltipItem, data) {
                const { label } = data.datasets[tooltipItem.datasetIndex];
                return `${label} - ${formattedDuration(tooltipItem.value)}`;
              },
            },
          },
        },
      });
      setChart(newChartInstance);
    }
  }, [chartRef]);

  useEffect(() => {
    updateChartWithData();
  }, [chart, workTimesSumByTag]);

  return (
    <canvas ref={chartRef} />
  );
}

export default MilestoneTagBreakdownChart;
