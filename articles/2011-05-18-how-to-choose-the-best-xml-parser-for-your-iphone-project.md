---
layout: post
title: How To Choose The Best XML Parser for Your iPhone Project
date: 2011-05-18 06:31
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>原文：http://www.raywenderlich.com/553/how-to-chose-the-best-xml-parser-for-your-iphone-project</p>
<div class="entry" style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<div id="attachment_554" class="wp-caption alignright" style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;float:right;width:260px;border:0 initial initial;margin:0 10px 10px;padding:10px 0 0 10px;"><a rel="attachment wp-att-554" href="http://www.raywenderlich.com/553/how-to-chose-the-best-xml-parser-for-your-iphone-project/xmlparserlist"><img class="size-full wp-image-554" style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;" title="XMLPerformance Test App Extended To Compare 3rd Party Libraries" src="http://d1xzuxjlafny7l.cloudfront.net/wp-content/uploads/2010/02/XMLParserList.jpg" alt="XMLPerformance Test App Extended For 3rd Party Libraries" width="250" height="375" /></a>
<p class="wp-caption-text" style="font-weight:inherit;font-style:inherit;font-size:smaller;font-family:'Helvetica Neue', Arial, Helvetica, sans-serif;vertical-align:baseline;color:#aeaeae;text-align:center;border:0 initial initial;margin:0;padding:0 0 5px;">XMLPerformance Test App Extended To Compare 3rd Party Libraries</p>
</div>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">There are a lot of options when it comes to parsing XML on the iPhone. The iPhone SDK comes with two different libraries to choose from, and there are several popular third party libraries available such as TBXML, TouchXML, KissXML, TinyXML, and GDataXML. How is a developer to choose?</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">I have been recently taking a look at the various options out there, and ended up extending the XMLPerformance sample from Apple to try out each of the above libraries to learn how they worked and compare their performance. I thought I’d share what I’ve learned thus far to others who might be searching for the best XML library for their iPhone project.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">In this article we’ll give a detailed comparison of the features and performance of the most popular iPhone libraries, explain how to choose between them, and give a sample project showing how to read XML data using each of the above libraries.</p>
<h2 style="font-weight:bold;font-style:inherit;font-size:18px;font-family:inherit;vertical-align:baseline;color:#006837;border:0 initial initial;margin:0;padding:5px 0 15px;">SAX vs. DOM</h2>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Before we begin, I wanted to make sure everyone is aware of the most important difference between XML parsers: whether the parser is a SAX or a DOM parser.</p>
<ul style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0 0 0 40px;padding:0;">
<li>A <em>SAX parser</em> is one where your code is notified as the parser walks through the XML tree, and you are responsible for keeping track of state and constructing any objects you might want to keep track of the data as the parser marches through.</li>
<li>A <em>A DOM parser</em> reads the entire document and builds up an in-memory representation that you can query for different elements. Often, you can even construct XPath queries to pull out particular pieces.</li>
</ul>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Ok, now let’s discuss some of the libraries!</p>
<h2 style="font-weight:bold;font-style:inherit;font-size:18px;font-family:inherit;vertical-align:baseline;color:#006837;border:0 initial initial;margin:0;padding:5px 0 15px;">The Most Popular XML Parsers for the iPhone</h2>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">In my research, here’s what seemed to me to be the most popular XML Parsers for the iPhone, and a brief description of each one:</p>
<ul style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0 0 0 40px;padding:0;">
<li><a href="http://developer.apple.com/iphone/library/documentation/Cocoa/Reference/Foundation/Classes/NSXMLParser_Class/Reference/Reference.html">NSXMLParser</a> is a SAX parser included by default with the iPhone SDK. It’s written in Objective-C and is quite straightforward to use, but perhaps not quite as easy as the DOM model.</li>
<li><a href="http://xmlsoft.org/">libxml2</a> is an Open Source library that is included by default with the iPhone SDK. It is a C-based API, so is a bit more work to use than NSXML. The library supports both DOM and SAX processing. The libxml2 SAX processor is especially cool, as it has a unique feature of being able to parse the data as it’s being read. For example, you could be reading a large XML document from the network and displaying data that you’re reading for it to the user while you’re still downloading.</li>
<li><a href="http://www.tbxml.co.uk/">TBXML</a> is a lightweight DOM XML parser designed to be as quick as possible while consuming few memory resources. It saves time by not performing validation, not supporting XPath, and by being read-only – i.e. you can read XML with it, but you can’t then modify the XML and write it back out again.</li>
<li><a href="http://code.google.com/p/touchcode/wiki/TouchXML">TouchXML</a> is an NSXML style DOM XML parser for the iPhone. Like TBXML, it is also read-only, but unlike TBXML it does support XPath.</li>
<li><a href="http://code.google.com/p/kissxml">KissXML</a> is another NSSXML style DOM XML parser for the iPhone, actually based on TouchXML. The main difference is KissXML also supports editing and writing XML as well as reading.</li>
<li><a href="http://www.grinninglizard.com/tinyxml/">TinyXML</a> is a small C-based DOM XML parser that consists of just four C files and two headers. It supports both reading and writing XML documents, but it does not support XPath on its own. However, you can use a related library – TinyXPath – for that.</li>
<li><a href="http://code.google.com/p/gdata-objectivec-client/source/browse/trunk/Source/XMLSupport/">GDataXML</a> is yet another NSXML style DOM XML parser for the iPhone, developed by Google as part of their Objective-C client library. Consisting of just a M file and a header, it supports both reading and writing XML documents and XPath queries.</li>
</ul>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Ok, now let’s start comparing all these libraries!</p>
<h2 style="font-weight:bold;font-style:inherit;font-size:18px;font-family:inherit;vertical-align:baseline;color:#006837;border:0 initial initial;margin:0;padding:5px 0 15px;">XML Parser Performance Comparison App</h2>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;"><a rel="attachment wp-att-555" href="http://www.raywenderlich.com/553/how-to-chose-the-best-xml-parser-for-your-iphone-project/xmlparserstats"><img class="alignnone size-full wp-image-555" style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;" title="XML Parser Stats Display in Test App" src="http://d1xzuxjlafny7l.cloudfront.net/wp-content/uploads/2010/02/XMLParserStats.jpg" alt="XML Parser Stats Display in Test App" width="320" height="480" /></a></p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Apple has made an excellent code sample called XMLPerformance that allows you to compare the time it takes to parse a ~900KB XML document containing the top 300 iTunes songs with both the NSXML and libxml2 APIs.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">The sample allows you to choose a parsing method and then parse the document, and it keeps statistics on how long it took to download the file and parse the file in a database. You can then go to a statistics screen to see the average download and parse times for each method.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">I thought this would be an ideal way to test out how these various APIs performed against each other, so I extended the sample to include all of the above libraries. You can download the updated project below if you want to try it out on your device. It also serves as a nice example of how to use each of the above APIs!</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;"><a href="http://d1xzuxjlafny7l.cloudfront.net/downloads/XMLPerformance.zip">Download Updated XMLPerformance Project</a></p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">A note on the project: if the library included XPath support, I used it for a single lookup, because I felt it represented the way the library would be used in practice. But of course XPath is generally slower than manually walking through the tree, so it adds to the benchmarks for those libraries.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">So anyway – I’ll discuss the results of how things performed on my device here with the sample written as-is – but feel free to give it a shot on your device, or tweak the code based on the actual XML data you need to parse!</p>
<h2 style="font-weight:bold;font-style:inherit;font-size:18px;font-family:inherit;vertical-align:baseline;color:#006837;border:0 initial initial;margin:0;padding:5px 0 15px;">XML Parser Performance Comparison</h2>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Here’s some graphs that shows how quickly the various parsers parsed the XML document on my device (an iPhone 3Gs):</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;"><a rel="attachment wp-att-556" href="http://www.raywenderlich.com/553/how-to-chose-the-best-xml-parser-for-your-iphone-project/xmlparserspeed"><img class="alignnone size-full wp-image-556" style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;" title="Parsing Time By Parser" src="http://d1xzuxjlafny7l.cloudfront.net/wp-content/uploads/2010/02/XMLParserSpeed.jpg" alt="Parsing Time By Parser" width="617" height="270" /></a></p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">As you can see here, NSXMLParser was the slowest method by far. TBXML was the fastest, which makes sense because many features were taken out in order to optimize parse time for reading only.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">I was surprised, however, to see that TBXML and some of the other DOM parsing methods performed faster than libxml2′s SAX parser, which I had thought would be the fastest of all of the methods. I haven’t profiled it, but my guess as to why it is slower is because of the frequent string compares needed to parse the document in the SAX method.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">However, don’t discount libxml2′s SAX method by looking at this chart. Remember that libxml2 is the only one of these methods that can parse the document as it’s reading in – so it can let your app start displaying data right away rather than having to let the download finish first.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Ok, here’s a graph that shows the peak memory usage by parser (this was obtained through running the various methods through the Object Allocations tool):</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;"><a rel="attachment wp-att-557" href="http://www.raywenderlich.com/553/how-to-chose-the-best-xml-parser-for-your-iphone-project/xmlparsermemoryusage"><img class="alignnone size-full wp-image-557" style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;" title="Memory Usage By Parser" src="http://d1xzuxjlafny7l.cloudfront.net/wp-content/uploads/2010/02/XMLParserMemoryUsage.jpg" alt="Memory Usage By Parser" width="614" height="283" /></a></p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Note that the DOM methods usually require more memory overhead than the SAX methods (with the exception of TBXML, which is indeed quite efficient). This is something to consider when you are dealing with especially large documents, given the memory constraints on an iPhone.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Also note that libxml2′s SAX method is the best option as far as peak memory usage is concerned (and I suspect it would scale better than the others as well).</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Finally, let’s wrap up with a chart that summarizes the differences between the parsers and everything we’ve discussed above:</p>
<table style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:1px solid #000000;margin:0 0 20px;padding:0;">
<tbody>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<th> </th><th>NSXML</th><th>libxml2 – SAX</th><th>TBXML</th><th>TouchXML</th><th>KissXML</th><th>TinyXML</th><th>GDataXML</th><th>libxml2 – DOM</th>
</tr>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<td class="key" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:left;color:#ffffff;margin:0;padding:5px;">Included with SDK?</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">Yes</td>
</tr>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<td class="key" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:left;color:#ffffff;margin:0;padding:5px;">Seconds to Parse</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">1.87</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">1.19</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">0.68</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">1.1</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">1.37</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">1.27</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">1.07</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">0.84</td>
</tr>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<td class="key" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:left;color:#ffffff;margin:0;padding:5px;">Peak Memory Usage</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">3.11</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">3.01</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">3.07</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">6.5</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">5.25</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">4.8</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">4.15</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">4.97</td>
</tr>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<td class="key" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:left;color:#ffffff;margin:0;padding:5px;">Parse While Downloading?</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
</tr>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<td class="key" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:left;color:#ffffff;margin:0;padding:5px;">Edit/Save XML?</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
</tr>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<td class="key" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:left;color:#ffffff;margin:0;padding:5px;">XPath Support?</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">No</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes*</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Yes</td>
</tr>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<td class="key" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:left;color:#ffffff;margin:0;padding:5px;">C or Obj-C</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Obj-C</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">C</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Obj-C</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Obj-C</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Obj-C</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">C</td>
<td class="good" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;color:#006837;margin:0;padding:5px;">Obj-C</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">C</td>
</tr>
<tr style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<td class="key" style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:left;color:#ffffff;margin:0;padding:5px;">License</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">Apple</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">MIT</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">MIT</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">MIT</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">MIT</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">ZLib</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">Apache</td>
<td style="font-weight:normal;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0;padding:5px;">MIT</td>
</tr>
</tbody>
</table>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">* = with TinyXPath</p>
<h2 style="font-weight:bold;font-style:inherit;font-size:18px;font-family:inherit;vertical-align:baseline;color:#006837;border:0 initial initial;margin:0;padding:5px 0 15px;">Which To Choose?</h2>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">Which XML parser to choose really depends on what you want to do with the parser.</p>
<ul style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0 0 0 40px;padding:0;">
<li>If you just want to <em>read small XML documents</em>, performance doesn’t matter as much with small documents. You probably want to pick something with XPath support and something that is written in Objective-C to make your job easier. So I’d recommend either TouchXML, KissXML, or GDataXML for this case.</li>
<li>If you want to both <em>read and write small XML documents</em>, again performance doesn’t matter as much as functionality and ease of use. You probably want to pick something with XPath support, written in Objective-C, with read/write capability. So I’d recommend KissXML or GDataXML for this case.</li>
<li>If you want to <em>read extremely large XML documents</em>, performance is the critical issue here. You’ll want to consider libxml2 SAX, TBXML, or libxml DOM for this, depending on what your exact situation is.</li>
</ul>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">What about the ones I didn’t mention?</p>
<ul style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0 0 0 40px;padding:0;">
<li><em>NSXML</em> is a decent choice if you’re dealing with relatively small documents, and you don’t feel like adding a third party library to the SDK.</li>
<li><em>TinyXML</em> could be an OK choice for medium sized documents if you already have experience with the API and are comfortable with C as it ports quite easily over to the iPhone.</li>
</ul>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">I took a look at two other XML libraries during the course of this investigation (VTD-XML and Objective-XML), but I couldn’t get them working. If someone else has had more luck with these, feel free to extend the sample project to include them!</p>
<h2 style="font-weight:bold;font-style:inherit;font-size:18px;font-family:inherit;vertical-align:baseline;color:#006837;border:0 initial initial;margin:0;padding:5px 0 15px;">Where To Go From Here?</h2>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">If you’re looking for some help using one of these libraries, check out my post on <a href="http://www.raywenderlich.com/725/how-to-read-and-write-xml-documents-with-gdataxml">How to Read and Write XML Documents with GDataXML</a>.</p>
<p style="font-weight:inherit;font-style:inherit;font-size:13px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 0 10px;">And if anyone has any additional feedback about these libraries or tips that may help other developers, please chime in below!</p>
</div></p>
