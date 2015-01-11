# * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * *
# Drop this in to the view
disqus_shortname = "therealisticorganizer" # required: replace example with your forum shortname

# * * DON'T EDIT BELOW THIS LINE * *
(->
  dsq = document.createElement("script")
  dsq.type = "text/javascript"
  dsq.async = true
  dsq.src = "//" + disqus_shortname + ".disqus.com/embed.js"
  (document.getElementsByTagName("head")[0] or document.getElementsByTagName("body")[0]).appendChild dsq
  return
)()
