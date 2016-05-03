function formatpiechartdatalabel(val, lbl) {
    var color = 'black';
    var IndexColor = 'black';
    var ValueLabel = lbl.split('*')[0];
    var TestLabel = lbl.split('*')[1];
    if (sTestSection == "Significance")
        color = getSignificanceClass(TestLabel);
    else if (sTestSection == "Index")
        IndexColor = getIndexShareClass(TestLabel);
    if (sTestSection == "Index")
        strHTML = '<div class="chartLabelvalue" style="color:' + color + ' !important;">' + val + ' %<span class="chartLabelvalue" style="color:' + IndexColor + ' !important"> (' + TestLabel + ')</span></div><div class="chartLabelData">' + formatWithLineBreaks(ValueLabel) + '</div>';
    else
        strHTML = '<div class="chartLabelvalue" style="color:' + color + ' !important;">' + val + ' %</div><div class="chartLabelData">' + formatWithLineBreaks(ValueLabel) + '</div>';
    return strHTML;
}