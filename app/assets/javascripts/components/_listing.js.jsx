var Listing = React.createClass({
	render: function() {
		var self = this;
		var price = self.props.price;

		var formatted_price = '$' + price.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');

		return (
	    <div className="col-sm-6 col-md-4">
	      <div className="thumbnail">
	        <div className="caption">
	        	{self.props.image ?
	        	<div>
	        		<a className="listing-link" data-remote="true" href={"/listings/"+ self.props.this_id }>
	        			<img src={self.props.image} />	
	        		</a>
	        	</div>
	        	: null }
	        	<h3>
	        		<a className="listing-link" data-remote="true" href={"/listings/"+ self.props.this_id }>{ self.props.title }</a>
	          	<span className="badge pull-right">{ self.props.count } views</span>
	          </h3>
	          <p>Category: <kbd>{ self.props.category.name }</kbd></p>
	          <p>{ formatted_price }</p>
	          <p>{ self.props.description }</p>
	          <p>{ self.props.expiry_date }</p>
	          { self.props.admin ?
		        <span>
		          <a className="btn btn-primary btn-block" href={"/listings/"+ self.props.this_id +"/edit"}>
	              <span className="glyphicon glyphicon-edit" aria-hidden="true"></span> Edit Listing
							</a>
							<a className="btn btn-danger btn-block" data-confirm="Are you sure?" data-method="delete" href={"/listings/"+ self.props.this_id} rel="nofollow">
		              <span className="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete Listing
							</a>
						</span>
						: null }
	        </div>
	      </div>
	    </div>
			)
	}
});