# README #

Repository for the rase package for R. It is unreleased and under development. 

Current version is rase 0.1-0

### To set up###

#### Easier way####

In R, having installed the devtools package, type:

`library(devtools)`

`install_bitbucket("rase","ignacioq")`

Run `library(rase)`

#### Other ####
Clone the repository and run in the terminal `R CMD INSTALL <path_to_rase_repository>`

Open R and run `library(rase)`

### Build and check tarball###

To build binary just run in the terminal `R CMD build <path_to_rase>`

To check the coherence of the package run in the terminal `R CMD CHECK <path_to_rase_tarball>`

### Who to talk to? ###

Ignacio Quintero <ignacio.quintero@yale.edu>,
Forrest Crawford <forrest.crawford@yale.edu>,
Petr Keil <pkeil@seznam.cz>


<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55013473-1', 'auto');
  ga('send', 'pageview');

</script>