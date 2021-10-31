# 2021-22 AAE6102 Satellite Communication and Navigation
## Intorduction

This repository is the assignment and laboratory for 2021-22 Sem. 1, AAE6102 Satellite Communication and Navigation. 

The aim of the assessment is to get familiar with decoding the GPS ephemeris data and using the pseudorange measurements with least-squares (LS) esitmation to resovle the receiver location. 


## Instructions
1. Clone this repository by,
   - command line
   - download the zip file and extract to desired folder
2. Open file '[main_aae6102_assignment_1.m](main_aae6102_assignment_1.m)' in MATLAB
3. Press 'Run'


## Code Explanation
The code can be divided into two main part. The first part requires us to use the orbit parameters in ephemeris data to resolve the satellites’ ECEF position and satellite clock offset. Followed by forming the linear system based on pseudorange observation. Finally, we can resolve the receiver position and clock offset by LS method. The flowchart is as follows, 
<p align="center">
<img src="Img/Figure_1_Flowchart.jpg">
</p>

The instruction on how to use the orbit parameters to estimate the satellite position for a given GPS time can be found in (ARINC, 2000). The satellites’ position can be calculated by Table 20-IV in (ARINC, 2000). After we obtained the earth-fixed coordinates, we also apply the earth rotation correction.


## Results
Initial position in earth-centred-earth-fixed (ECEF) coordinates (in meter) is `(-2694685.473m, -4293642.366m, 3857878.924m)`. 

The LS is solved iteratively. After several iteration, the ECEF solution (in meter) is `(-2700418.609m, -4292537.059m, 3855264.740m)`. In WGS84 coordinates format with latitude (degree), longitude (degree), and altitude(meter), it is `(37.428085437°, -122.173474221°, 70.629m)`. The estimated receiver clock offset is `519449.313m (0.0017327s)`. The estimated position error is `30.004m`.

NOTE: if you wish to disable troposheric delay correction, please change the value in [Line 12 in main_aae6102_assignment_1.m](main_aae6102_assignment_1.m#L12) to `false`, e.g. `ENA_TROPO_ERR_CORR = false;`

If the code excuted successfully, following figure will be shown.
<p align="center">
<img src="Img/Figure_2_Positioning-results.jpg">
</p>

And the variables change and update on each iteration are summarized in follow dryrun table,
<table class="MsoTableGrid" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:1184;mso-padding-alt:0cm 0cm 0cm 0cm">
 <tbody><tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes">
  <td width="56" style="width:42.3pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt"><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="173" colspan="2" style="width:129.9pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">LS solution, </span><!--[if gte msEquation 12]><m:oMath><i
   style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;font-family:
   "Cambria Math",serif'><m:r>&#8710;</m:r></span></i><m:acc><m:accPr><span
     style='font-size:10.0pt;mso-ansi-font-size:10.0pt;mso-bidi-font-size:10.0pt;
     font-family:"Cambria Math",serif;mso-ascii-font-family:"Cambria Math";
     mso-hansi-font-family:"Cambria Math";font-style:italic;mso-bidi-font-style:
     normal'><m:ctrlPr></m:ctrlPr></span></m:accPr><m:e><b style='mso-bidi-font-weight:
     normal'><span style='font-size:10.0pt;font-family:"Cambria Math",serif'><m:r><m:rPr><m:scr
        m:val="roman"/><m:sty m:val="b"/></m:rPr>x</m:r></span></b></m:e></m:acc></m:oMath><![endif]--><!--[if !msEquation]--><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:150%;
  font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:新細明體;mso-fareast-theme-font:
  minor-fareast;mso-bidi-theme-font:minor-bidi;position:relative;top:7.5pt;
  mso-text-raise:-7.5pt;mso-ansi-language:EN-GB;mso-fareast-language:ZH-TW;
  mso-bidi-language:AR-SA"><v:shape id="_x0000_i1025" type="#_x0000_t75" style="width:11.25pt;height:17.25pt">
   <v:imagedata src="21053478R+NG_Hoi-Fung+AAE6102+Assignment.files/image071.png" o:title="" chromakey="white">
  </v:imagedata></v:shape></span><!--[endif]--><span style="font-size:10.0pt"><o:p></o:p></span></p>
  </td>
  <td width="59" style="width:44.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-left-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;padding:
  0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt"><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="269" colspan="3" style="width:201.75pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">Updated estimations<o:p></o:p></span></p>
  </td>
  <td width="66" style="width:49.55pt;border:none;border-bottom:solid windowtext 1.0pt;
  mso-border-left-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt"><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:1">
  <td width="56" style="width:42.3pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">Iterations<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">Position change (</span><!--[if gte msEquation 12]><m:oMath><i
   style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;font-family:
   "Cambria Math",serif'><m:r>&#8710;</m:r><m:r>x</m:r></span></i></m:oMath><![endif]--><!--[if !msEquation]--><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:150%;
  font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:新細明體;mso-fareast-theme-font:
  minor-fareast;mso-bidi-theme-font:minor-bidi;position:relative;top:7.5pt;
  mso-text-raise:-7.5pt;mso-ansi-language:EN-GB;mso-fareast-language:ZH-TW;
  mso-bidi-language:AR-SA"><v:shape id="_x0000_i1025" type="#_x0000_t75" style="width:11.25pt;height:17.25pt">
   <v:imagedata src="21053478R+NG_Hoi-Fung+AAE6102+Assignment.files/image072.png" o:title="" chromakey="white">
  </v:imagedata></v:shape></span><!--[endif]--><span style="font-size:10.0pt">, </span><!--[if gte msEquation 12]><m:oMath><i
   style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;font-family:
   "Cambria Math",serif'><m:r>&#8710;</m:r><m:r>y</m:r></span></i></m:oMath><![endif]--><!--[if !msEquation]--><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:150%;
  font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:新細明體;mso-fareast-theme-font:
  minor-fareast;mso-bidi-theme-font:minor-bidi;position:relative;top:7.5pt;
  mso-text-raise:-7.5pt;mso-ansi-language:EN-GB;mso-fareast-language:ZH-TW;
  mso-bidi-language:AR-SA"><v:shape id="_x0000_i1025" type="#_x0000_t75" style="width:12pt;height:17.25pt">
   <v:imagedata src="21053478R+NG_Hoi-Fung+AAE6102+Assignment.files/image073.png" o:title="" chromakey="white">
  </v:imagedata></v:shape></span><!--[endif]--><span style="font-size:10.0pt">, </span><!--[if gte msEquation 12]><m:oMath><i
   style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;font-family:
   "Cambria Math",serif'><m:r>&#8710;</m:r><m:r>z</m:r></span></i></m:oMath><![endif]--><!--[if !msEquation]--><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:150%;
  font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:新細明體;mso-fareast-theme-font:
  minor-fareast;mso-bidi-theme-font:minor-bidi;position:relative;top:7.5pt;
  mso-text-raise:-7.5pt;mso-ansi-language:EN-GB;mso-fareast-language:ZH-TW;
  mso-bidi-language:AR-SA"><v:shape id="_x0000_i1025" type="#_x0000_t75" style="width:11.25pt;height:17.25pt">
   <v:imagedata src="21053478R+NG_Hoi-Fung+AAE6102+Assignment.files/image074.png" o:title="" chromakey="white">
  </v:imagedata></v:shape></span><!--[endif]--><span style="font-size:10.0pt">) (m)<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">Receiver clock delay<o:p></o:p></span></p>
  </td>
  <td width="59" style="width:44.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">Residual, </span><!--[if gte msEquation 12]><m:oMath><i
   style='mso-bidi-font-style:normal'><span style='font-size:10.0pt;font-family:
   "Cambria Math",serif'><m:r>δ</m:r></span></i><m:acc><m:accPr><span
     style='font-size:10.0pt;mso-ansi-font-size:10.0pt;mso-bidi-font-size:10.0pt;
     font-family:"Cambria Math",serif;mso-ascii-font-family:"Cambria Math";
     mso-hansi-font-family:"Cambria Math";font-style:italic;mso-bidi-font-style:
     normal'><m:ctrlPr></m:ctrlPr></span></m:accPr><m:e><b style='mso-bidi-font-weight:
     normal'><span style='font-size:10.0pt;font-family:"Cambria Math",serif'><m:r><m:rPr><m:scr
        m:val="roman"/><m:sty m:val="b"/></m:rPr>x</m:r></span></b></m:e></m:acc></m:oMath><![endif]--><!--[if !msEquation]--><span style="font-size:12.0pt;mso-bidi-font-size:11.0pt;line-height:150%;
  font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:新細明體;mso-fareast-theme-font:
  minor-fareast;mso-bidi-theme-font:minor-bidi;position:relative;top:7.5pt;
  mso-text-raise:-7.5pt;mso-ansi-language:EN-GB;mso-fareast-language:ZH-TW;
  mso-bidi-language:AR-SA"><v:shape id="_x0000_i1025" type="#_x0000_t75" style="width:11.25pt;height:17.25pt">
   <v:imagedata src="21053478R+NG_Hoi-Fung+AAE6102+Assignment.files/image075.png" o:title="" chromakey="white">
  </v:imagedata></v:shape></span><!--[endif]--><span style="font-size:10.0pt"><span style="mso-spacerun:yes">&nbsp;</span>(m<sup>2</sup>)<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.25pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">ECEF position (m)<o:p></o:p></span></p>
  </td>
  <td width="96" style="width:72.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">WGS84 LLA position (<span class="SpellE">deg</span>, <span class="SpellE">deg</span>, m)<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">Receiver clock delay<o:p></o:p></span></p>
  </td>
  <td width="66" style="width:49.55pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">Positioning error (m)<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:2">
  <td width="56" style="width:42.3pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0 (initial)<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">/<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">/<o:p></o:p></span></p>
  </td>
  <td width="59" style="width:44.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">/<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.25pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-2694685.473,<o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-4293642.366,<o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">3857878.924<o:p></o:p></span></p>
  </td>
  <td width="96" style="width:72.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">37.458376433,<o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-122.112338996,<o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-31.456<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">/<o:p></o:p></span></p>
  </td>
  <td width="66" style="width:49.55pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">6374.466<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:3">
  <td width="56" style="width:42.3pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">1<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-5732.970, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">1105.486, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-2614.371<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.0017327s <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">(519449.765m)<o:p></o:p></span></p>
  </td>
  <td width="59" style="width:44.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">1795.743<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.25pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-2700418.443, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-4292536.880, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">3855264.553<o:p></o:p></span></p>
  </td>
  <td width="96" style="width:72.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">37.428093219, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-122.173840136, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">57.578<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.0017327s <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">(519449.765m)<o:p></o:p></span></p>
  </td>
  <td width="66" style="width:49.55pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">30.073<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:4">
  <td width="56" style="width:42.3pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">2<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-0.165, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-0.179, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.187<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-0.0000000s <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">(-0.452m)<o:p></o:p></span></p>
  </td>
  <td width="59" style="width:44.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">1813.004<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.25pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-2700418.609, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-4292537.059, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">3855264.740<o:p></o:p></span></p>
  </td>
  <td width="96" style="width:72.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">37.428093241, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-122.173840639, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">57.882<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.0017327s <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">(519449.312m)<o:p></o:p></span></p>
  </td>
  <td width="66" style="width:49.55pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">30.004<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:5">
  <td width="56" style="width:42.3pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">3<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-0.000, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-0.000, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.000<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.0000000s <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">(0.001m)<o:p></o:p></span></p>
  </td>
  <td width="59" style="width:44.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">1813.000<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.25pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-2700418.609, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-4292537.059, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">3855264.740<o:p></o:p></span></p>
  </td>
  <td width="96" style="width:72.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">37.428093241, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-122.173840639, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">57.882<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.0017327s <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">(519449.313m)<o:p></o:p></span></p>
  </td>
  <td width="66" style="width:49.55pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">30.004<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:6;mso-yfti-lastrow:yes">
  <td width="56" style="width:42.3pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">4 (Final solution)<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-0.000, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-0.000, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.000<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.0000000s <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">(0.000m)<o:p></o:p></span></p>
  </td>
  <td width="59" style="width:44.0pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">1813.000<o:p></o:p></span></p>
  </td>
  <td width="90" style="width:67.25pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-2700418.609, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-4292537.059, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">3855264.740<o:p></o:p></span></p>
  </td>
  <td width="96" style="width:72.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">37.428093241, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">-122.173840639, <o:p></o:p></span></p>
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">57.882<o:p></o:p></span></p>
  </td>
  <td width="83" style="width:62.45pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">0.0017327s (519449.313m)<o:p></o:p></span></p>
  </td>
  <td width="66" style="width:49.55pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 0cm 0cm 0cm">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal"><span style="font-size:10.0pt">30.004<o:p></o:p></span></p>
  </td>
 </tr>
</tbody></table>

And skyplot of given dataset is as following, each circle represents one satellite, the color represents its SNR in dBHz, the text inside is the corresponding satellite ID.
<p align="center">
<img src="Img/Figure_3_Skyplot.jpg">
</p>

<!-- Please enjoy! :tada: -->

## Author
For any issues, please contact Hoi-Fung (Ivan) NG via email <21053478R@connect.polyu.hk>

## References
1. ARINC Research Corporation. (2000). GPS Interface Control Document ICD-GPS-200 (IRN-200C-004): Navstar GPS Space Segment and Aviation User Interfaces.
2. Herrera Olmo, Antonio & Suhandri, Hendy & Realini, Eugenio & Reguzzoni, Mirko & Lacy, Maria Clara de. (2015). goGPS: open-source MATLAB software. *GPS Solutions.* 20. 1-9. 10.1007/s10291-015-0469-x. 
3. Takasu Tomoji. (2009). RTKLIB: Open Source Program Package for RTK-GPS. *FOSS4G 2009.* Tokyo, Japan, November 2, 2009.

