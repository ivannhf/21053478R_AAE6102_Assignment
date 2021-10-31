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
<p align="center">
<img src="Img/eq_symbols/image002.png">
</p>
where <img src="Img/eq_symbols/image003.png"> is the transformed coordinates of each satellite, and will be stored and use for LS later. <img src="Img/eq_symbols/image004.png"> are X, Y, and Z coordinates of the satellite following Table 20-IV in (ARINC, 2000). 


## Results
The calculated satellite ECEF position and clock offset as follow,
| Satellite ID | Satellite ECEF X (m) | Satellite ECEF Y (m) | Satellite ECEF Z (m) | Satellite clock offset (s) | Satellite clock offset (m) |
| ------------ | -------------------- | -------------------- | -------------------- | -------------------------- | -------------------------- |
| 5            | -8855587.377         | -22060120.339        | -11922092.593        |  0.00018907                | 56680.482                  |
| 6            | -8087225.358         | -16945964.648        |  18816194.508        | -0.00000008                | -25.162                    |
| 10           |  9027649.354         |	-12319230.777        |  21737387.598        |  0.00003325                | 9967.388                   |
| 17           | -21277120.383        |	-7467120.981         |  14287503.452        | -0.00020490                | -61428.267                 |
| 22           | -13649527.756        |	 8229508.102         |  21122958.527        |  0.00022268                | 66757.213                  |
| 23           | -19452317.265        | -16750378.609        | -6918520.642         |  0.00001036                | 3105.913                   |
| 26           |  6162914.086         | -25286773.704        | -3541190.268         |  0.00028099                | 84239.633                  |
| 30           | -17713896.270        | -19797468.525        |  19209.132           | -0.00001004                | -3010.256                  |


Initial position in earth-centred-earth-fixed (ECEF) coordinates (in meter) is `(-2694685.473m, -4293642.366m, 3857878.924m)`. 

The LS is solved iteratively. After several iteration, the ECEF solution (in meter) is `(-2700418.609m, -4292537.059m, 3855264.740m)`. In WGS84 coordinates format with latitude (degree), longitude (degree), and altitude(meter), it is `(37.428085437°, -122.173474221°, 70.629m)`. The estimated receiver clock offset is `519449.313m (0.0017327s)`. The estimated position error is `30.004m`.

NOTE: if you wish to disable troposheric delay correction, please change the value in [Line 12 in main_aae6102_assignment_1.m](main_aae6102_assignment_1.m#L12) to `false`, e.g. `ENA_TROPO_ERR_CORR = false;`

If the code excuted successfully, following figure will be shown.
<p align="center">
<img src="Img/Figure_2_Positioning-results.jpg">
</p>

And the variables change and update on each iteration are summarized in follow dryrun table,
| Iterations   | LS solution: position X, Y, Z changed (m)   | LS solution: receiver clock changed  | Residual (m^2)    | Updated position ECEF (m)     | Updated position WGS84 LLA (deg, deg, m)  | Updated receiver clock offset     | Total positioning error (m)   |
| ------------ |  -------------------------------   | -----------------------------------  | ---------   | ------------------    | ----------------------------------------  | -----------------------------     | ----------------------------  |
| 0 (Initial) | /                              | /                        | /        | -2694685.473, -4293642.366, 3857878.924 | 37.458376433, -122.112338996, -31.456 | /  | 6374.466 |
| 1           | -5732.970, 1105.486, -2614.371 | 0.0017327s (519449.765m) | 1795.743 | -2700418.443, -4292536.880, 3855264.553 | 37.428093219, -122.173840136, 57.578  | 0.0017327s (519449.765m) | 30.073 |
| 2           | -0.165, -0.179, 0.187 | -0.0000000s (-0.452m) | 1813.004 | -2700418.609, -4292537.059, 3855264.740 | 37.428093241, -122.173840639, 57.882  | 0.0017327s (519449.312m) | 30.004 |
| 3           | -0.000, -0.000, 0.000 | 0.0000000s (0.001m) | 1813.000 | -2700418.609, -4292537.059, 3855264.740 | 37.428093241, -122.173840639, 57.882  | 0.0017327s (519449.313m) | 30.004 |
| 4 (Final solution) | -0.000, -0.000, 0.000 | 0.0000000s (0.000m) | 1813.000 | -2700418.609, -4292537.059, 3855264.740 | 37.428093241, -122.173840639, 57.882  | 0.0017327s (519449.313m) | 30.004 |



And skyplot of given dataset is as following, each circle represents one satellite, the color represents its SNR in dBHz, the text inside is the corresponding satellite ID.
<p align="center">
<img src="Img/Figure_3_Skyplot.jpg">
</p>

Please enjoy! :tada:

## Author
For any issues, please contact Hoi-Fung (Ivan) NG via email <21053478R@connect.polyu.hk>

## References
1. ARINC Research Corporation. (2000). GPS Interface Control Document ICD-GPS-200 (IRN-200C-004): Navstar GPS Space Segment and Aviation User Interfaces.
2. Herrera Olmo, Antonio & Suhandri, Hendy & Realini, Eugenio & Reguzzoni, Mirko & Lacy, Maria Clara de. (2015). goGPS: open-source MATLAB software. *GPS Solutions.* 20. 1-9. 10.1007/s10291-015-0469-x. 
3. Takasu Tomoji. (2009). RTKLIB: Open Source Program Package for RTK-GPS. *FOSS4G 2009.* Tokyo, Japan, November 2, 2009.

