<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" data-toggle="tooltip" title="<?php echo $button_filter; ?>" onclick="$('#filter-seo').toggleClass('hidden-sm hidden-xs');" class="btn btn-default hidden-md hidden-lg"><i class="fa fa-filter"></i></button>
        <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-url-alias').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid"><?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row">
      <div id="filter-seo" class="col-md-3 col-md-push-9 col-sm-12 hidden-sm hidden-xs">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-filter"></i> <?php echo $text_filter; ?></h3>
          </div>
          <div class="panel-body">
            <div class="form-group">
              <label class="control-label" for="input-query"><?php echo $entry_query; ?></label>
              <input type="text" name="filter_query" value="<?php echo $filter_query; ?>" placeholder="<?php echo $entry_query; ?>" id="input-query" class="form-control" />
            </div>
            <div class="form-group">
              <label class="control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
              <input type="text" name="filter_keyword" value="<?php echo $filter_keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
            </div>
            <div class="form-group">
              <label class="control-label" for="input-store"><?php echo $entry_store; ?></label>
              <select name="filter_store_id" id="input-store" class="form-control">
                <option value=""></option>
                <?php if ($filter_store_id == '0' ) { ?>
                <option value="0" selected="selected"><?php echo $text_default; ?></option>
                <?php } else { ?>
                <option value="0"><?php echo $text_default; ?></option>
                <?php } ?>                  
                <?php foreach ($stores as $store) { ?>
                <?php if ($store['store_id'] == $filter_store_id) { ?>
                <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
            <div class="form-group">
              <label class="control-label" for="input-language"><?php echo $entry_language; ?></label>
              <select name="filter_language_id" id="input-language" class="form-control">
                <option value=""></option>
                  <?php foreach ($languages as $language) { ?>
                  <?php if ($language['language_id'] == $filter_language_id) { ?>
                <option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                  <?php } else { ?>
                <option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
              </select>
            </div>
            <div class="text-right">
              <button type="button" id="button-filter" class="btn btn-default"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-9 col-md-pull-3 col-sm-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
          </div>
          <div class="panel-body">
            <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-url-alias">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                      <td class="text-left"><?php if ($sort == 'query') { ?><a href="<?php echo $sort_query; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_query; ?></a><?php } else { ?><a href="<?php echo $sort_query; ?>"><?php echo $column_query; ?></a><?php } ?></td>
                      <td class="text-left"><?php if ($sort == 'keyword') { ?><a href="<?php echo $sort_keyword; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_keyword; ?></a> <?php } else { ?><a href="<?php echo $sort_keyword; ?>"><?php echo $column_keyword; ?></a><?php } ?></td>
                      <td class="text-left"><?php if ($sort == 'store') { ?><a href="<?php echo $sort_store; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_store; ?></a><?php } else { ?><a href="<?php echo $sort_store; ?>"><?php echo $column_store; ?></a><?php } ?></td>
                      <td class="text-left"><?php if ($sort == 'language') { ?><a href="<?php echo $sort_language; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_language; ?></a><?php } else { ?><a href="<?php echo $sort_language; ?>"><?php echo $column_language; ?></a><?php } ?></td>
                      <td class="text-right"><?php echo $column_action; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <?php if ($seo_urls) { ?>
                  <?php foreach ($seo_urls as $seo_url) { ?>
                  <tr>
                    <td class="text-center"><?php if (in_array($seo_url['seo_url_id'], $selected)) { ?>
                      <input type="checkbox" name="selected[]" value="<?php echo $seo_url['seo_url_id']; ?>" checked="checked" />
                      <?php } else { ?>
                      <input type="checkbox" name="selected[]" value="<?php echo $seo_url['seo_url_id']; ?>" />
                      <?php } ?></td>
                    <td class="text-left"><?php echo $seo_url['query']; ?></td>
                    <td class="text-left"><?php echo $seo_url['keyword']; ?></td>
                    <td class="text-left"><?php echo $seo_url['store']; ?></td>
                    <td class="text-left"><?php echo $seo_url['language']; ?></td>
                    <td class="text-right"><a href="<?php echo $seo_url['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                  </tr>
                  <?php } ?>
                  <?php } else { ?>
                  <tr>
                    <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
                  </tr>
                  <?php } ?>
                    </tbody>
                </table>
              </div>
            </form>
            <div class="row">
              <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
              <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	var url = 'index.php?route=design/seo_url&token=<?php echo $token; ?>';

	var filter_query = $('input[name=\'filter_query\']').val();

	if (filter_query) {
		url += '&filter_query=' + encodeURIComponent(filter_query);
	}

	var filter_keyword = $('input[name=\'filter_keyword\']').val();

	if (filter_keyword) {
		url += '&filter_keyword=' + encodeURIComponent(filter_keyword);
	}

	var filter_store_id = $('select[name=\'filter_store_id\']').val();

	if (filter_store_id) {
		url += '&filter_store_id=' + encodeURIComponent(filter_store_id);
	}
	
	var filter_language_id = $('select[name=\'filter_language_id\']').val();

	if (filter_language_id) {
		url += '&filter_language_id=' + encodeURIComponent(filter_language_id);
	}

	location = url;
});
//--></script> 
</div>
<?php echo $footer; ?>
