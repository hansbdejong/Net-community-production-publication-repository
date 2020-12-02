# Net-community-production-publication-repository
Code for the publication: DeJong, Hans B., et al. "Net community production and carbon export during the late summer in the Ross Sea, Antarctica." Global Biogeochemical Cycles 31.3 (2017): 473-491. (https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2016GB005417)

## Figures
All of the figures are created using MATLAB. Many of the figures contain maps. We use the M-Map MATLAB package (https://www.eoas.ubc.ca/~rich/map.html)

## Mixed Layer Depth Calculations

### mixed_layer_calculator.m

We estimated the mixed layer depth (MLD) in the Ross Sea by using density thresholds, where we calculated
the difference in density between each depth point and a surface value (Δσ<sub>t</sub>: reference depth = 8 m). The MLD
was defined as the depth where Δσ<sub>t</sub> first exceeds a threshold. We found that no single density threshold accurately captured the MLD for all sites during our cruise (see Figure S3). Therefore, we used Δσ<sub>t</sub>>0.02 for the south site and the 76°30' transect, Δσ<sub>t</sub>>0.05 for the north site, and Δσ<sub>t</sub>>0.125 for Terra Nova Bay.

## Nutrient Budget Calculations

We calculated the deficits (Def) of nDIC and nNO3 (in mol m<sup>-2</sup>) by subtracting the integrated nutrient stock at
each station from the prebloom integrated stock according to:

<img src="https://render.githubusercontent.com/render/math?math=Def(X)=\int_{0}^{200} (X(winter))dz - \int_{0}^{200} (X(late \: summer))dz  ">

where X is the nutrient concentration in mol m<sup>-3</sup>. Similarly, we calculated the surplus (Surp) of POC and DOC (in mol m<sup>-2</sup>) from prebloom conditions as follows:

<img src="https://render.githubusercontent.com/render/math?math=Surp(X)=\int_{0}^{200} (X(late \: summer))dz -\int_{0}^{200} (X(winter))dz">

To calculate sNCP (mol m<sup>-2</sup>, prebloom to the sampling date), we corrected the nDIC deficit for air-sea CO2 fluxes in mol m<sup>-2</sup> from 1 November, prior to substantial clearing of sea ice, to the sampling date. A positive CO2 flux represents flux into the ocean:

<img src="https://render.githubusercontent.com/render/math?math=sNCP = Def(nDIC) %2B \int_{Nov\ 1}^{arrival} (CO_2 \: flux)dt">

Finally, to calculate sExport_200 below 200m depth (in mol m<sup>-2</sup>, prebloom to the sampling date), we subtracted the upper water column total organic carbon standing stock (TOC = DOC + POC) from the estimated sNCP:

<img src="https://render.githubusercontent.com/render/math?math=sExport_{200} = sNCP - Surp(TOC)">

### calculates_station_co2_flux.m and co2flux.m

We calculated the daily air-sea CO2 fluxes at each station from 1 November until the station arrival date following

<img src="https://render.githubusercontent.com/render/math?math=CO_2 \: flux = (1-A)ks(\Delta \textit{p}CO_2) ">

where A is the proportion of each grid cell that is covered by sea ice, k is the CO2 gas transfer velocity
(cm h m<sup>-1</sup>), s is the solubility of CO2 in seawater (mol L m<sup>-1</sup> atm m<sup>-1</sup>), and ΔpCO2 is the pCO2 of the atmosphere (pCO2_atm) minus the pCO2 of seawater. The gas transfer velocity term “k” is a function of wind speed at
10m height (U10) and the temperature-dependent Schmidt number (Sc) (Wanninkhof, 1992):

<img src="https://render.githubusercontent.com/render/math?math=k \: = \:  0.31 \: U_{10}^2 \ (Sc/660)^{-0.5} ">

The solubility term “s” is a function of temperature and salinity (Weiss, 1974). 

We used the following data sets to calculate daily CO2 fluxes:

### sea_ice_call_number_extract.m and Bremen_sea_ice_daily.m 

Daily sea ice fractional cover: 6.25 km resolution Advanced Microwave Scanning Radiometer-2 sea ice concentration data from the University of Bremen (Spreen et al., 2008). These scripts extract the daily sea ice fractional cover for each hydrocast station from Nov 1 2012 till the date of station arrival. The script **sea_ice_call_number_extract.m** uses the M-Map library. 

### NOAA_SST_weekly.m

Temperature: weekly 1° × 1° NOAA Optimum Interpolation Sea Surface Temperature V2 (Reynolds et al., 2002). This script extracts the weekly modeled temperature for each hydrocast station from Nov 1 2012 till the date of station arrival.

### NCAR_wind_daily.m

Wind speed: National Centers for Environmental Prediction/National Center for Atmospheric Research (NCEP/NCAR) Reanalysis daily wind data at 10m height (Kalnay et al., 1996). This script extracts the daily modeled wind speed for each hydrocast station from Nov 1 2012 till the date of station arrival.

We set salinity to 34.5 and set pCO2_atm to 391 ppm, the concentration of atmospheric CO2 at the South Pole and Palmer Station (Antarctic Peninsula) at the time (GLOBALVIEW-CO2, 2013).

### pCO2_merge_files.m and station_pCO2.m

We estimated the time evolution of surface water pCO2 at each station from 1 November until the station arrival date with the Lamont-
Doherty Earth Observatory (LDEO) pCO2 database (Takahashi et al., 2009) from 1994 through 2013. We gridded the Ross Sea pCO2 data by 2° longitude and 1° latitude and calculated the mean pCO2 value for each 10 day interval per grid cell. We linearly interpolated between
10 day intervals when pCO2 data were absent. For grid cells without early spring pCO2 data, we assumed that pCO2 was 425 μatm on 1 November (Sweeney, 2003) and linearly declined until the next 10 day interval where pCO2 data existed.

## Uncertainty Estimates

### DIC_deficit_error.m and POC_surp_error.m

We used Monte Carlo simulations to estimate the uncertainty of the deficit and surplus calculations. These simulations involved three steps per station per nutrient. First, we calculated the integrated nutrient stock (0–200 m, mol m<sup>-2</sup>) 10000 times. For these integrations, each nutrient value was randomly sampled from a normal distribution based on the measured value and estimated parameter uncertainty. Second, we calculated the prebloom integrated nutrient stock (0–200 m, mol m<sup>-2</sup>) 10000 times. The prebloom nutrient concentrations were randomly sampled from a normal distribution based on the estimated prebloom value and uncertainty. Finally, we calculated the deficit or surplus 10000 times with the integrated nutrient stocks (observed and prebloom). We define uncertainty for each deficit/surplus as the standard deviation of the simulated deficits/surpluses.

Finally, we estimated the uncertainties of Surp(TOC), sNCP, and sExport_200 through error propogation:

<img src="https://render.githubusercontent.com/render/math?math=\sigma^{2}_{X \pm Y} = \sigma_{X}^{2} %2B \sigma_{Y}^{2} ">

where σ2 is the variance and X and Y represent the parameters that are summed or subtracted. This approach
assumes that the errors are random, independent, and normally distributed.






