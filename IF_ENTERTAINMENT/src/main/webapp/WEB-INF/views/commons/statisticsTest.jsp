<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #container{
            width: 1000px;
        }
    </style>
</head>
<body>
    <div id="container_keyword"></div>
</body>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/wordcloud.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script> 
<script>
const text =
    'Chapter 1. Down the Rabbit-Hole ' +
    'Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: ' +
    'once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations ' +
    'in it, \'and what is the use of a book,\' thought Alice \'without pictures or conversation?\'' +
    'So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy ' +
    'and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking ' +
    'the daisies, when suddenly a White Rabbit with pink eyes ran close by her.',
    lines = text.replace(/[():'?0-9]+/g, '').split(/[,\. ]+/g),
    data = lines.reduce((arr, word) => {
        let obj = Highcharts.find(arr, obj => obj.name === word);
        if (obj) {
            obj.weight += 1;
        } else {
            obj = {
                name: word,
                weight: 1
            };
            arr.push(obj);
        }
        return arr;
    }, []);

Highcharts.chart('container_keyword', {
    accessibility: {
        screenReaderSection: {
            beforeChartFormat: '<h5>{chartTitle}</h5>' +
                '<div>{chartSubtitle}</div>' +
                '<div>{chartLongdesc}</div>' +
                '<div>{viewTableButton}</div>'
        }
    },
    series: [{
        type: 'wordcloud',
        data,
        name: 'Occurrences'
    }],
    title: {
        text: 'Wordcloud of Alice\'s Adventures in Wonderland',
        align: 'left'
    },
    subtitle: {
        text: 'An excerpt from chapter 1: Down the Rabbit-Hole',
        align: 'left'
    },
    tooltip: {
        headerFormat: '<span style="font-size: 16px"><b>{point.key}</b></span><br>'
    }
});

$(function(){
	// 하이차트 링크 삭제
	$(".highcharts-credits").hide();
	
	
	
});


</script>
</html>
