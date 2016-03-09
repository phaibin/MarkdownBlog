---
layout: post
title: Easy custom UITableView drawing
date: 2011-07-08 13:28
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>原文：<a href="http://cocoawithlove.com/2009/04/easy-custom-uitableview-drawing.html">http://cocoawithlove.com/2009/04/easy-custom-uitableview-drawing.html</a></p>
<h4 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:22px;margin:0 0 4px;padding:8px 0 4px;">Make my table pretty</h4>
<p>Customizing your <code style="font-family:Courier, monospace;font-size:12px;">UITableView</code> can be really easy. You don't need custom drawing code. You don't need subclasses of anything. Cocoa Touch provides all the drawing capability you need, all you have to do is use the right classes in the right ways and provide the layout.</p>
<h4 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:22px;margin:0 0 4px;padding:8px 0 4px;">The sample application</h4>
<p>The approach I'll show you will turn the table on the left into the table on the right:</p>
<p><img style="border:0 initial initial;margin:auto;" src="http://lh5.ggpht.com/_gfktUGS0ov0/SfW4y9Ic6SI/AAAAAAAAASw/LXvmLTvjCQU/customtableview.png?imgmax=800" border="0" alt="customtableview.png" width="550" height="405" /></p>
<p style="text-align:center;"><em>Left: a default <code style="font-family:Courier, monospace;font-size:12px;">UITableView</code> with three rows. Right: the same table view after customization.</em></p>
<h4 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:22px;margin:0 0 4px;padding:8px 0 4px;">How to fail at UITableView customizing</h4>
<p>The following are all <em><strong>really bad ways</strong></em> to customize a table (even though you can make it work):</p>
<ul style="padding-left:26px;">
<li>Subclassing <code style="font-family:Courier, monospace;font-size:12px;">UITableView</code> to customize the drawing of cells</li>
<li>Subclassing <code style="font-family:Courier, monospace;font-size:12px;">UITableViewCell</code> to customize the drawing of cell content</li>
<li>Creating your own array of <code style="font-family:Courier, monospace;font-size:12px;">UITableViewCell</code>s and returning these instead of using<code style="font-family:Courier, monospace;font-size:12px;">dequeueReusableCellWithIdentifier:</code></li>
</ul>
<p>About the second point: it is okay to customize <code style="font-family:Courier, monospace;font-size:12px;">UITableViewCell</code> — but you shouldn't really use it for drawing. The <code style="font-family:Courier, monospace;font-size:12px;">UITableViewCell</code> class is more of a controller class — it handles behaviors and layout, not drawing. You can customize <code style="font-family:Courier, monospace;font-size:12px;">UITableViewCell</code> to load a specific <code style="font-family:Courier, monospace;font-size:12px;">contentView</code> (and do the custom drawing there).</p>
<p>That last point (that you should always use <code style="font-family:Courier, monospace;font-size:12px;">dequeueReusableCellWithIdentifier:</code>) is only peripherally related to drawing but it will significantly slow your drawing down if you avoid the normal cell queuing architecture.</p>
<h4 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:22px;margin:0 0 4px;padding:8px 0 4px;">How to succeed at UITableView customizing</h4>
<p>There are only a few points to understand related to table drawing.</p>
<p><strong>First</strong>: the <code style="font-family:Courier, monospace;font-size:12px;">UITableView</code> does not itself draw anything except the background. To customize the background of a <code style="font-family:Courier, monospace;font-size:12px;">UITableView</code>, all you need to do is set its <code style="font-family:Courier, monospace;font-size:12px;">backgroundColor</code> to <code style="font-family:Courier, monospace;font-size:12px;">[UIColor clearColor]</code> and you can draw your own background in a view <em>behind</em> the <code style="font-family:Courier, monospace;font-size:12px;">UITableView</code>.</p>
<p><strong>Second</strong>: The <code style="font-family:Courier, monospace;font-size:12px;">tableHeaderView</code> (and the table footer and section headers and footers) need not be just a title. You can insert your own view, with its own subviews in the table header, giving layout and custom drawing freedom.</p>
<p><strong>Third</strong>: <code style="font-family:Courier, monospace;font-size:12px;">UITableViewCell</code> is composed of 5 different subviews. Customizing the right subview is the secret to good <code style="font-family:Courier, monospace;font-size:12px;">UITableViewCell</code> drawing. The subviews are:</p>
<ol>
<li><code style="font-family:Courier, monospace;font-size:12px;">backgroundView</code> — the entire background of the row (including what looks like the<code style="font-family:Courier, monospace;font-size:12px;">UITableView</code>'s background in <code style="font-family:Courier, monospace;font-size:12px;">UITableViewStyleGrouped</code> style tables.</li>
<li><code style="font-family:Courier, monospace;font-size:12px;">selectedBackgroundView</code> — replaces the <code style="font-family:Courier, monospace;font-size:12px;">backgroundView</code> when the row is selected.</li>
<li><code style="font-family:Courier, monospace;font-size:12px;">image</code> — a customizable image (not actually a subview) at the left of the cell.</li>
<li><code style="font-family:Courier, monospace;font-size:12px;">accessoryView</code> — a customizable view at the right of the cell.</li>
<li><code style="font-family:Courier, monospace;font-size:12px;">contentView</code> — a customizable view between the <code style="font-family:Courier, monospace;font-size:12px;">image</code> and the <code style="font-family:Courier, monospace;font-size:12px;">accessoryView</code>(technically, it extends behind the <code style="font-family:Courier, monospace;font-size:12px;">image</code>).</li>
</ol>
<p>You can customize any of these (except <code style="font-family:Courier, monospace;font-size:12px;">image</code> which must be a <code style="font-family:Courier, monospace;font-size:12px;">UIImage</code>) using your own custom drawn views.</p>
<p>However, since the pixel size of the table never changes, it is often easiest just to use<code style="font-family:Courier, monospace;font-size:12px;">UIImageView</code>s for each of them. Then you can take highly complex views drawn in separate programs, cut them into the 5 necessary pieces and let the automatic caching of <code style="font-family:Courier, monospace;font-size:12px;">UIImage</code>'s named image cache manage your memory for you.</p>
<p>There is an argument against drawing your views in code and that is that the iPhone's drawing is not nearly as fast as Mac OS X. Operations like gradients and multiple overlapped components can really tax the iPhone.</p>
<p>Custom drawing code is a good choice for simple and flat colour drawing. In most other cases — as in this post — I recommend you use <code style="font-family:Courier, monospace;font-size:12px;">UIImageView</code> to draw your views in a table.</p>
<h4 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:22px;margin:0 0 4px;padding:8px 0 4px;">Implementation</h4>
<p>With all custom drawing handled by <code style="font-family:Courier, monospace;font-size:12px;">UIImageView</code>, that still leaves some work to do. You must handle all layout and configuring of views.</p>
<h5 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:18px;margin:0 0 4px;padding:8px 0 4px;">Configuration of the UITableView and layout of the table header</h5>
<p>As an example of what that means, have a look at the <code style="font-family:Courier, monospace;font-size:12px;">viewDidLoad</code> method for this post:</p>
<pre style="color:#001b4c;font-size:10px;font-family:Monaco, monospace;padding:8px;">- (void)viewDidLoad
{
    //
    // Change the properties of the imageView and tableView (these could be set
    // in interface builder instead).
    //
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = 100;
    tableView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"gradientBackground.png"];</pre></p>

<p>    //<br />
    // Create a header view. Wrap it in a container to allow us to position<br />
    // it better.<br />
    //<br />
    UIView *containerView =<br />
        [[[UIView alloc]<br />
            initWithFrame:CGRectMake(0, 0, 300, 60)]<br />
        autorelease];<br />
    UILabel *headerLabel =<br />
        [[[UILabel alloc]<br />
            initWithFrame:CGRectMake(10, 20, 300, 40)]<br />
        autorelease];<br />
    headerLabel.text = NSLocalizedString(@"Header for the table", @"");<br />
    headerLabel.textColor = [UIColor whiteColor];<br />
    headerLabel.shadowColor = [UIColor blackColor];<br />
    headerLabel.shadowOffset = CGSizeMake(0, 1);<br />
    headerLabel.font = [UIFont boldSystemFontOfSize:22];<br />
    headerLabel.backgroundColor = [UIColor clearColor];<br />
    [containerView addSubview:headerLabel];<br />
    self.tableView.tableHeaderView = containerView;<br />
}
<p>This method handles the configuration of the <code style="font-family:Courier, monospace;font-size:12px;">tableView</code> (setting the <code style="font-family:Courier, monospace;font-size:12px;">backgroundColor</code>, <code style="font-family:Courier, monospace;font-size:12px;">rowHeight</code>and sets an image behind the table) but also creates its own layout for the table header.</p>
<p>The layout of the header here is for the table's header view. You can include a custom header for every table section by implementing the <code style="font-family:Courier, monospace;font-size:12px;">UITableViewDelegate</code> method<code style="font-family:Courier, monospace;font-size:12px;">tableView:viewForHeaderInSection:</code>. There are equivalent properties and methods for the table and section footers.</p>
<p>It is possible to handle this type of layout in Interface Builder and load the XIB files for this type of layout. Sadly though, on the iPhone, reading loading lots of views from XIB files is slow (I suspect this is due to slow reading from the Flash memory) and doesn't always allow configuration of every property.</p>
<p>For this reason, I normally sketch my views in Interface Builder and then manually recreate the same thing in code. That's what I've done here: picking coordinates for the <code style="font-family:Courier, monospace;font-size:12px;">headerLabel</code> that looks balanced in the view.</p>
<h5 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:18px;margin:0 0 4px;padding:8px 0 4px;">Cell backgrounds</h5>
<p>The cell background needs to incorporate the tops and bottoms of table "sections". For this reason, the <code style="font-family:Courier, monospace;font-size:12px;">backgroundView</code> and <code style="font-family:Courier, monospace;font-size:12px;">selectedBackgroundView</code> normally need to be set on a row-by-row basis.</p>
<p>In your <code style="font-family:Courier, monospace;font-size:12px;">tableView:cellForRowAtIndexPath:</code> method where you are configuring the cell for a given row, this code will handle that behavior:</p>
<pre style="color:#001b4c;font-size:10px;font-family:Monaco, monospace;padding:8px;">UIImage *rowBackground;
UIImage *selectionBackground;
NSInteger sectionRows = [aTableView numberOfRowsInSection:[indexPath section]];
NSInteger row = [indexPath row];
if (row == 0 &amp;&amp; row == sectionRows - 1)
{
    rowBackground = [UIImage imageNamed:@"topAndBottomRow.png"];
    selectionBackground = [UIImage imageNamed:@"topAndBottomRowSelected.png"];
}
else if (row == 0)
{
    rowBackground = [UIImage imageNamed:@"topRow.png"];
    selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
}
else if (row == sectionRows - 1)
{
    rowBackground = [UIImage imageNamed:@"bottomRow.png"];
    selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
}
else
{
    rowBackground = [UIImage imageNamed:@"middleRow.png"];
    selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
}
((UIImageView *)cell.backgroundView).image = rowBackground;
((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;</pre>
<h5 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:18px;margin:0 0 4px;padding:8px 0 4px;">Layout within the contentView</h5>
<p>Layout of elements within the <code style="font-family:Courier, monospace;font-size:12px;">contentView</code> need only be set on construction of the <code style="font-family:Courier, monospace;font-size:12px;">contentView</code>(not on a row-by-row basis).</p>
<p>Sadly, laying out <code style="font-family:Courier, monospace;font-size:12px;">UILabel</code>s in the <code style="font-family:Courier, monospace;font-size:12px;">contentView</code> (like the "Cell at row X." and "Some other infomation." lables in this example) is a little verbose.</p>
<p>The following code is run immediately after the allocation of the <code style="font-family:Courier, monospace;font-size:12px;">UITableViewCell</code> to position the "Cell at row X." label:</p>
<pre style="color:#001b4c;font-size:10px;font-family:Monaco, monospace;padding:8px;">const CGFloat LABEL_HEIGHT = 20;
UIImage *image = [UIImage imageNamed:@"imageA.png"];</pre></p>

<p>//<br />
// Create the label for the top row of text<br />
//<br />
topLabel =<br />
    [[[UILabel alloc]<br />
        initWithFrame:<br />
            CGRectMake(<br />
                image.size.width + 2.0 * cell.indentationWidth,<br />
                0.5 * (aTableView.rowHeight - 2 * LABEL_HEIGHT),<br />
                aTableView.bounds.size.width -<br />
                    image.size.width - 4.0 * cell.indentationWidth<br />
                        - indicatorImage.size.width,<br />
                LABEL_HEIGHT)]<br />
    autorelease];<br />
[cell.contentView addSubview:topLabel];</p>

<p>//<br />
// Configure the properties for the text that are the same on every row<br />
//<br />
topLabel.tag = TOP_LABEL_TAG;<br />
topLabel.backgroundColor = [UIColor clearColor];<br />
topLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];<br />
topLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];<br />
topLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];</p>

<p>//<br />
// Create a background image view.<br />
//<br />
cell.backgroundView = [[[UIImageView alloc] init] autorelease];<br />
cell.selectedBackgroundView = [[[UIImageView alloc] init] autorelease];
<p>In my mind, it seems like there should be a more efficient way to do this. I hold out the possibility that there is.</p>
<p>This code spends most of its time working out where the label should be placed. It needs to go right of the image, left of the <code style="font-family:Courier, monospace;font-size:12px;">accessoryView</code>, middle of the row but above the "Some other information." label.</p>
<h5 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:18px;margin:0 0 4px;padding:8px 0 4px;">Other adornments</h5>
<p>The <code style="font-family:Courier, monospace;font-size:12px;">accessoryView</code> is just a <code style="font-family:Courier, monospace;font-size:12px;">UIImageView</code>. The <code style="font-family:Courier, monospace;font-size:12px;">cell.image</code> is set as a property. These are extremely simple additions but they make the table cells far more impactful.</p>
<h4 style="font-family:Baskerville, 'Times New Roman', Times, serif;font-weight:lighter;font-style:italic;color:#000000;font-size:22px;margin:0 0 4px;padding:8px 0 4px;">Conclusion</h4>
<blockquote>You can download the <a href="http://projectswithlove.com/projects/EasyCustomTable.zip">EasyCustomTable project as a zip file</a> (60kb).</blockquote>
<p> </p></p>
