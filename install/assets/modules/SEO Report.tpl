/**
 * SEO Report
 *
 * <strong>Beta 1</strong> Seo4Evo Report view
 *
 * @version     Beta 1
 * @author      Author: Nicola Lambathakis http://www.tattoocms.it/
 * @internal	@modx_category Manager
 * @internal    @properties &ArticleModuleTitle=Main Page Module Title:;string;Seo4Evo Report &ArticleModuleIcon=AwesomeFont icon:;string;fa-line-chart &ParentFolder=Parent folder:;string;0 &ListItems=Max items in List:;string;all &hideFolders= Hide Folders:;list;yes,no;yes &dittolevel= Depht:;string;3 &ListBoxFilter= Enable filter:;list;yes,no;no &dittofilter= Filter:;string; 
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 */
/******
SEO Report

&ArticleModuleTitle=Main Page Module Title:;string;Seo4Evo Report &ArticleModuleIcon=AwesomeFont icon:;string;fa-line-chart &ParentFolder=Parent folder:;string;0 &ListItems=Max items in List:;string;all &hideFolders= Hide Folders:;list;yes,no;yes &dittolevel= Depht:;string;3 &ListBoxFilter= Enable filter:;list;yes,no;no &dittofilter= Filter:;string; 
****
*/
if(!defined('MODX_BASE_PATH')){die('What are you doing? Get out of here!');}
global $manager_theme;

/*basic params*/
$parentId = $ParentFolder;
$dittototal = $ListItems;

// Table Row Tpl
$rowTpl = '@CODE: <tr>
<td class="bg-warning" width="5%">[+id+]</td><td class="small"> <b>[+pagetitle+]</b></td>
<td class="small">[+CustomTitle+]</td>
<td class="small">[+MetaKeywords+]</td>
<td class="small">[+introtext+]</td>
<td class="small">[+RobotsFollow+],[+RobotsIndex+]</td>
<td class="small">[+sitemap_exclude+]</td>
<td class="small">[+sitemap_priority+]</td>
<td class="small">[+sitemap_changefreq+]</td>
<td class="bg-info" width="5%"><a class="btn btn-sm btn-info" href="[(site_url)]index.php?id=[+id+]" target="_blank" title="preview"><i class="fa fa-eye"></i></a></td>
<td class="bg-success" width="5%"><a class="btn btn-sm btn-success" onclick="window.open(\'index.php?a=27&id=[+id+]\',\'Elements\',\'width=800,height=600,top=\'+((screen.height-600)/2)+\',left=\'+((screen.width-800)/2)+\',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no\')" style="cursor: pointer;"><i class="fa fa-pencil-square-o"></i></a></td>


</tr>';

// Ditto parameters
$params['parents'] = $parentId;
$params['depth'] = $dittolevel;
$params['sortBy'] = 'menuindex ASC';
$params['tpl'] = $rowTpl;
$params['total'] = $dittototal;
if ($ListBoxFilter == yes) {
$params['filter'] = $dittofilter;
}
if ($hideFolders == yes) {
$params['hideFolders'] = '1';
}
if ($hideFolders == no) {
$params['hideFolders'] = '0';
}
// run Ditto
$Articlelist = $modx->runSnippet('Ditto', $params);

//Table Tpl
$ListOutput = '	
<div class="main-wrapper">
           <div><h3 class="text-success"><i class="fa '.$ArticleModuleIcon.'"></i> '.$ArticleModuleTitle.'</h3></div><hr>
<div class="widget-stage overflowscroll"><table class="sortable table table-hover table-bordered table-condensed table-striped table-responsive">
   <thead>
          <th data-defaultsort="desc">Id</th>
      <th>Page Title</th>
	  <th>CustomTitle</th>
	   <th>MetaKeywords</th>
	   <th>MetaDescription</th>
	     <th>Robots</th>
		 <th>Sitemap Exclude</th>
		 <th>Sitemap Priority</th>
		 <th>Sitemap update</th>
   <th>View</th>
      <th>Edit</th>
            </thead>
            <tbody>'.$Articlelist.'</tbody>
			</table><br style="clear:both;height:1px;margin-top: -1px;line-height:1px;font-size:1px;" /> </div></div>';

//Module Layout
$Module = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
	<link href="../assets/modules/ArticleManager/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/js/table/jquery.dataTables.min.css" rel="stylesheet">
<link href="../assets/modules/ArticleManager/js/table/dataTables.bootstrap.min.css" rel="stylesheet">
<script src="../assets/modules/ArticleManager/js/jquery.min.js"></script>
<script src="../assets/modules/ArticleManager/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/modules/ArticleManager/js/table/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function(){
    $(".sortable").dataTable();
});
</script>
	</head>
	<body>
	<style>
	body {background: #eeeeee;}
	.sortable {background: #ffffff; margin-top:15px;}
	.main-wrapper {margin-top:15px; background: #ffffff; padding:15px; border:1px solid #dedede; border-radius:8px;}
	input {border-radius: 3px; 
	-webkit-transition: all 0.30s ease-in-out;
  -moz-transition: all 0.30s ease-in-out;
  -ms-transition: all 0.30s ease-in-out;
  -o-transition: all 0.30s ease-in-out;
  outline: none;
  padding: 3px 0px 3px 3px;
  margin: 5px 1px 3px 0px;
  border: 1px solid #DDDDDD;
  }
	input:focus   {box-shadow: 0 0 5px rgba(81, 203, 238, 1);
  padding: 3px 0px 3px 3px;
  margin: 5px 1px 3px 0px;
  border: 1px solid rgba(81, 203, 238, 1);}
  select{
   width: 150px;
   padding: 5px;
   font-size: 16px;
   line-height: 1;
   border:1px solid #dedede;
   border-radius: 2px;
   height: 34px;   
   background: #ffffff;
background: linear-gradient(to bottom,  #ffffff 0%,#f3f3f3 50%,#ededed 51%,#ffffff 100%);
}
thead {background: #ffffff;
background: linear-gradient(to bottom,  #ffffff 0%,#f3f3f3 50%,#ededed 51%,#ffffff 100%);}
	</style>
	 <div class="container-fluid">
                <div class="tabbable">'.$ListOutput.'</div>
				</div>
				</div>
</body>
				</html>';            
	//end page

//the end
$output = $Module;
echo $output;
