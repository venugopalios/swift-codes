//
//  ViewController.m
//  DonutWithHtml
//
//  Created by Macbook Pro on 21/08/14.
//  Copyright (c) 2014 AnalyticsQuotient. All rights reserved.
//

#import "ViewController.h"

#import "Reachability.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //Negative Bar Chart with complete Design
//    $(function () {
//        $('#container').highcharts({
//        chart: {
//        type: 'column',
//        plotBorderWidth: 1,
//        },
//        title: {
//        text: ''
//        },
//    colors :['#79bd8f' , '#2a5769'  ,'#f37321' , '#ffd34e' , '#729D48'],
//        yAxis:{
//        gridLineWidth:1,
//        gridLineDashStyle:'shortdot',
//        plotLines: [{
//        zIndex: 2,
//        color: '#D5D5D5',
//        width: 1,
//        value: 0
//        }],
//        title:{
//        text:'',
//        },
//        labels: {
//        formatter: function(){
//            return this.value + '%';
//        }
//        }
//            
//        },
//        xAxis: {
//        lineWidth: 0,
//        minorGridLineWidth: 0,
//        lineColor: 'transparent',
//        labels: {
//        enabled: false
//        },
//        minorTickLength: 0,
//        tickLength: 0,
//        },
//        legend: {
//        enabled: false
//        },
//        exporting: {
//        enabled: false
//        },
//        credits: {
//        enabled: false
//        },
//        series: [ {
//        name: 'Jane',
//        colorByPoint: true,
//        data: [2, -2, -3, 2, 1]
//        }]
//        });
//    });
    
    
    
    
    
//    Reachability *reachability = [Reachability reachabilityForInternetConnection];
//
//    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
//    
//    NSLog(@"%u",internetStatus);
//    
//    if (internetStatus != NotReachable)
//        
//    {
//        // Write your code here.
//    }
//    
//    else
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reachability" message:@"Please check your internet connection." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        
//        [alert show];
//    }
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
//    
//    float val = 53.37;
//    
//    NSString *str = @"Android 53";
//    
//    NSString *htmStr = [NSString stringWithFormat:@"<html>\n<head>\n<script type=\"text/javascript\">\nwindow.onload = function () {\nvar chart = new CanvasJS.Chart(\"chartContainer\",{\nlegend:{\nverticalAlign: \"bottom\",horizontalAlign: \"center\"\n},data: [\n{\nindexLabelFontSize: 35,\nindexLabelFontFamily: \"Garamond\",\nindexLabelFontColor: \"darkgrey\",\nindexLabelPlacement: \"outside\",type: \"pie\",\ndataPoints: [\n{  y: %f, indexLabel: \"%@%%\" },\n{  y: 35.0, indexLabel: \"Apple iOS 35%%\" },\n{  y: 7,indexLabel: \"Blackberry 7%%\" },\n{  y: 2, indexLabel: \"Windows Phone 2%%\" },\n{  y: 5, indexLabel: \"Others 5%%\" }]}]});\nchart.render();\n}</script><script type=\"text/javascript\" src=\"canvasjs.min.js\"></script>\n<body>\n<div id=\"chartContainer\" style=\"height: 900px; width: 950px;\">\n</div></body></html>",val,str];

    
    
    //Pie ChartView
    
//    float val = 45.0;
////    int val1 = 200;
//    NSString *str = @"Firefox";

    
//    NSMutableString *newhtmlStr = [[NSMutableString alloc] initWithString:@"<html>\n<head>"];
//    [newhtmlStr appendString:@"<script src=\"jquery-1.9.1.js\"></script>"];
//    [newhtmlStr appendString:@"<script src=\"profile.js\"></script>"];
//    [newhtmlStr appendString:@"<script type=\"text/javascript\">"];
//    [newhtmlStr appendString:@"$(function () {"];
//    [newhtmlStr appendString:@"Highcharts.getOptions().plotOptions.pie.colors = (function () {"];
//    [newhtmlStr appendString:@"var colors = [],base = Highcharts.getOptions().colors[0],i;"];
//    [newhtmlStr appendString:@"for (i = 0; i < 10; i += 1) {"];
//    [newhtmlStr appendString:@"colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());}"];
//    [newhtmlStr appendString:@"return colors;}());"];
//    [newhtmlStr appendString:@"$('#container').highcharts({"];
//    [newhtmlStr appendString:@"chart: {"];
//    [newhtmlStr appendString:@"plotBackgroundColor: null,plotBorderWidth: null,plotShadow: false},"];
////    [newhtmlStr appendString:@"title: {text: 'Browser market shares at a specific website, 2014'},"];
//    [newhtmlStr appendString:@"exporting :{enabled:false,},"];
////    [newhtmlStr appendString:@"tooltip: {pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'},"];
//    [newhtmlStr appendString:@"plotOptions: {"];
//    [newhtmlStr appendString:@"pie: {"];
//    [newhtmlStr appendString:@"allowPointSelect: false,"];
//    [newhtmlStr appendString:@"cursor: 'pointer',"];
//    [newhtmlStr appendString:@"dataLabels: {"];
//    [newhtmlStr appendString:@"enabled: true,"];
//    [newhtmlStr appendString:@"useHTML: true,"];
//    
//    int value = 1;
//    
//    if (value == 1) {
//    
//        [newhtmlStr appendString:@"format: '<b>{point.name}</b><br> {point.y:.1f} % <span style=\"color:{point.customColor}\">({point.custom})</span>',"];
//    }
//    else
//        [newhtmlStr appendString:@"format: '<b>{point.name}</b><br> {point.y:.1f} %',"];
//    
//    
//    [newhtmlStr appendString:@"style: {"];
//    [newhtmlStr appendString:@"color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'"];
//    [newhtmlStr appendString:@"}}}},"];
//    [newhtmlStr appendString:@"series: [{"];
//    [newhtmlStr appendString:@"type: 'pie',"];
////    [newhtmlStr appendString:@"innerSize: '70%',"];
//    [newhtmlStr appendString:@"name: 'Browser share',"];
//    [newhtmlStr appendString:@"data: ["];
//    
//    for (int i=0; i<4; i++) {
//    
//        [newhtmlStr appendString:[NSString stringWithFormat:@"{name:'%@',   y:%.f,customColor:'red',custom:100},",str,val]];//Sending parameters
//        
//    }
//    
//    [newhtmlStr appendString:@"]"];
//    [newhtmlStr appendString:@" }]"];
//    [newhtmlStr appendString:@"});"];
//    [newhtmlStr appendString:@"});"];
//    [newhtmlStr appendString:@"</script>"];
//    [newhtmlStr appendString:@"<script src=\"highcharts.js\"></script>"];
//    [newhtmlStr appendString:@"<script src=\"exporting.js\"></script>"];
//    [newhtmlStr appendString:@"<div id=\"container\" style=\"height: 100%; width: 100%; margin: 0 auto\"></div>"];
//    [newhtmlStr appendString:@"</body></html>"];

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    
    NSArray *arr = [[NSArray alloc] initWithObjects:@"10", nil];
    
    NSArray *arr1 = [[NSArray alloc] initWithObjects:@"40", nil];
    
    [dict1 setObject:arr forKey:@"USA"];
    
    [dict1 setObject:arr1 forKey:@"Brazil"];
    
    [dict1 setObject:arr forKey:@"UK"];
    
    [dict1 setObject:arr1 forKey:@"Brazil"];
    
    [dict setObject:dict1 forKey:@"Long"];
    [dict setObject:dict1 forKey:@"Short"];
    [dict setObject:dict1 forKey:@"Very Long"];

    
    NSMutableString *newhtmlStr = [[NSMutableString alloc] initWithString:@"<html>\n<head>"];
    [newhtmlStr appendString:@"<script src=\"jquery.min.js\"></script>"];
    [newhtmlStr appendString:@"<script type=\"text/javascript\">"];
    [newhtmlStr appendString:@"$(function () {"];
    [newhtmlStr appendString:@"$('#container').highcharts({"];
    [newhtmlStr appendString:@"chart: {type: 'bubble',marginTop:30,inverted:true},"];
    [newhtmlStr appendString:@"title: {text: ''},"];
    [newhtmlStr appendString:@"colors :['#071F3B' , '#017486'  ,'#2E5E5A' , '#457354' , '#729D48' , '#8AB240' , '#A7CD3F' , '#CEE523' , '#F2EB0F' , '#FFCE00'],"];
    [newhtmlStr appendString:@"labels:{style:{ width:'50px'}},"];
    [newhtmlStr appendString:@"legend:{verticalAlign:'bottom',useHTML:true,align:'center'},"];
    [newhtmlStr appendString:@"credits:{enabled:false},"];
    [newhtmlStr appendString:@"xAxis:{gridLineWidth:1,gridLineDashStyle:'shortdot',categories:[],tickInterval:20,title:{text:'Share %',}},"];
    
    [newhtmlStr appendString:@"tooltip :{enabled :true,useHTML :true,"];
    [newhtmlStr appendString:@"formatter:function(){"];
    [newhtmlStr appendString:@"console.log(this);"];
    [newhtmlStr appendString:@"return \"<div class='labeltext'><span style='position:relative;text-align:center;'>\"+this.point.name+\"</span><br><span style='position:relative;text-align:center;'>Total Sample : \"+this.point.totalSample+\"</span><br><span style='position:relative;text-align:center;'>Total Sample : \"+this.point.baseValue+\"</span><br><span style='position:relative;text-align:center;'>Total Sample : \"+this.point.sampleShare+\"</span></div>\";}"];
    
    [newhtmlStr appendString:@"},"];
    
    [newhtmlStr appendString:@"exporting :{enabled:false},"];
    [newhtmlStr appendString:@"yAxis:{gridLineWidth:0,tickInterval:5,showFirstLabel:false,title:{enabled:false},labels:{useHTML:true}},"];
    [newhtmlStr appendString:@"plotOptions: {series: {dataLabels: {enabled: true,useHTML:true,"];
    [newhtmlStr appendString:@"formatter:function(){"];
    [newhtmlStr appendString:@"return \"<div class='labeltext'><span style='position:relative;text-align:center;'>\"+this.y+\"%</span><br><span style='position:relative;text-align:center;'>\"+this.point.custom+\"</span></div>\";}"];
    [newhtmlStr appendString:@"}},"];
    [newhtmlStr appendString:@"bubble:{maxSize:45,states:{hover:{enabled:false}},"];
    [newhtmlStr appendString:@"marker:{fillOpacity:0.8}}},"];
    
    [newhtmlStr appendString:@"series: ["];
    
    for (int i=0; i< [[dict allKeys] count]; i++) {
        
        [newhtmlStr  appendString:[NSString stringWithFormat:@"{name:'%@',",[[dict allKeys] objectAtIndex:i]]];
        [newhtmlStr  appendString:@"data: ["];
        
        for (int j=0; j< [[[dict objectForKey:[[dict allKeys] objectAtIndex:i]] allKeys] count]; j++) {
            
            [newhtmlStr appendString:[NSString stringWithFormat:@"{x:%d,y:%@,name:'%@',custom:100},",(20*(j+1)),[[[dict objectForKey:[[dict allKeys] objectAtIndex:i]] objectForKey:[[[dict objectForKey:[[dict allKeys] objectAtIndex:i]] allKeys] objectAtIndex:j]] objectAtIndex:0], [[[dict objectForKey:[[dict allKeys] objectAtIndex:i]] allKeys] objectAtIndex:j]]];
            
        }
        [newhtmlStr  appendString:@"]},"];
    }
    [newhtmlStr appendString:@"]"];
    [newhtmlStr appendString:@"});});"];
    [newhtmlStr appendString:@"</script>"];
    [newhtmlStr appendString:@"<script src=\"highcharts.js\"></script>"];
    [newhtmlStr appendString:@"<script src=\"highcharts-more.js\"></script>"];
    [newhtmlStr appendString:@"<script src=\"exporting.js\"></script>"];
    [newhtmlStr appendString:@"<div id=\"container\" style=\"height: 100%; width: 100%; margin: 0 auto\"></div>"];
    [newhtmlStr appendString:@"</body></html>"];
    
//    NSLog(@"%@",newhtmlStr);
    
    UIWebView *wordWebview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45, 320, 300)];
    wordWebview.backgroundColor = [UIColor grayColor];
    wordWebview.scalesPageToFit = YES;
    wordWebview.scrollView.delegate = self;
    wordWebview.scrollView.scrollEnabled = NO;
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    [wordWebview loadHTMLString:newhtmlStr baseURL:baseURL];
    [self.view addSubview:wordWebview];

    
    //Negative Bar Graph
//    $(function () {
//        $('#container').highcharts({
//        chart: {
//        type: 'column'
//        },
//        title: {
//        text: ''
//        },
//        xAxis: {
//        categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
//        },
//        credits: {
//        enabled: false
//        },
//        plotOptions: {
//        series: {
//        colorByPoint: true
//        }
//        },
//        series: [ {
//        name: 'Jane',
//        data: [2, -2, -3, 2, 1]
//        }]
//        });
//    });
    
    
    
}
-(UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView {
    return nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
