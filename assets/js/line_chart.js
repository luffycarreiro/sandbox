import Chart from 'chart.js/auto'
import 'chartjs-adapter-luxon'

export default class {
  constructor(ctx) {
    this.colors = [
      'rgba(255, 99, 132, 1)',
      'rgba(54, 162, 235, 1)',
      'rgba(255, 206, 86, 1)',
      'rgba(75, 192, 192, 1)',
      'rgba(153, 102, 255, 1)',
      'rgba(255, 159, 64, 1)'
    ]

    const config = {
      type: 'bar',
      data: { datasets: [], labels: []},
      options: {
        scales: {
          y: {
            suggestedMin: 0,
            suggestedMax: 1
          }
        }
      }
    }

    this.chart = new Chart(ctx, config)
  }

  addPoint(label, value, name) {
    const dataset = this._findDataset(label) || this._createDataset(label, name)
    dataset.data.push({x: Date.now(), y: value})
    console.log(this.chart.data)
    this.chart.update()
  }

  destroy() {
    this.chart.destroy()
  }

  _findDataset(label) {
    return this.chart.data.datasets.find((dataset) => dataset.label === label)
  }

  _createDataset(label) {
    const newDataset = {label, data: [], backgroundColor: this.colors.pop()}
    this.chart.data.datasets.push(newDataset)
    return newDataset
  }
}