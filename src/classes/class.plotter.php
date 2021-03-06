<?php

class Plotter {


    /**
     * @var Event
     */
    private $event;

    /**
     * @param int $id
     * @throws Exception
     */
    public function __construct($event) {

        $this->event           = $event;

    }


    public function rankingBarPlot($who,$where) {


        $mdpoints = $this->event->pointsPerMatchday($who);

        $userscollection = new UserCollection($this->event->getId());

        $ticks = json_encode($userscollection->getUserNames($who));

        $series = [];
        $matchdays = [];
        foreach($mdpoints as $md) {
            $mdname = array_pop($md);
            $matchdays[] = array('label' => $mdname);
            $series[] = array_values($md);
        }

        $series = json_encode($series, JSON_NUMERIC_CHECK);
        $serieslabels = json_encode($matchdays);

        $p = "

        $(document).ready(function(){
          pointsPlot = $.jqplot('".$where."', ".$series.", {
                // Tell the plot to stack the bars.
                stackSeries: true,
                animate: !$.jqplot.use_excanvas,
                captureRightClick: true,
                seriesDefaults:{
                  renderer:$.jqplot.BarRenderer,
                  rendererOptions: {
                       barDirection: 'horizontal',
                      // Put a 30 pixel margin between bars.
                      barMargin: 5,
                      // Highlight bars when mouse button pressed.
                      // Disables default highlighting on mouse over.
                      highlightMouseDown: true
                  },
                },
                series : ".$serieslabels.",
                axes: {
                  yaxis: {
                      renderer: $.jqplot.CategoryAxisRenderer,
                      ticks: ".$ticks."
                  },
                  xaxis: {
                    // Don't pad out the bottom of the data range.  By default,
                    // axes scaled as if data extended 10% above and below the
                    // actual range to prevent data points right on grid boundaries.
                    // Don't want to do that here.
                    padMin: 0
                  }
                },
                legend: {
                  show: true,
                  location: 'e',
                  placement: 'outside'
                }
              });
              // Bind a listener to the 'jqplotDataClick' event.  Here, simply change
              // the text of the info3 element to show what series and ponit were
              // clicked along with the data for that point.
              $('#".$where."').bind('jqplotDataClick',
                function (ev, seriesIndex, pointIndex, data) {
                  $('#".$where."Info').html(pointsPlot.axes.yaxis.ticks[pointIndex]+
                            ', <i>'+pointsPlot.series[seriesIndex]['label']+'</i>'+
                            ': '+data[0]);
                }
              );
            });

        ";
        return $p;
    }


}