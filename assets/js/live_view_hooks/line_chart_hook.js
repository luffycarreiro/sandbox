import RealtimeLineChart from '../line_chart'

export default {
  mounted() {
    this.chart = new RealtimeLineChart(this.el)

    this.handleEvent('new-point', ({ label, value, name }) => {
      this.chart.addPoint(label, value, name)
    })
  },
  destroyed() {
    this.chart.destroy()
  }
}