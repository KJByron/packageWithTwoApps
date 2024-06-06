
if(FALSE){
  # ShinyApp
  devtools::document()  # creates NAMESPACE and help files
  devtools::test()      # runs units tests
  devtools::check()     # runs *all* tests
  devtools::build()     # make tarball
}


## build package and launch app
pkgload::load_all()
packageWithTwoApps::month_app()
# packageWithTwoApps::data_app()


## publish
# deploy one app at a time, comment out the other
# rsconnect::deployApp(here::here(), appName = "month_app")
# rsconnect::deployApp(here::here(), appName = "data_app")




