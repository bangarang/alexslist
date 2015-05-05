var ListingBox = React.createClass({
	getInitialState: function () {
    return this.props
  },
  componentWillMount: function () {
      this.setState({current_listings: this.state.listings, title: "All Listings"})  
  },


  filterAll: function () {
    this.setState({current_listings: this.state.listings, title: "All Listings", price: null})  
  },

  filterCars: function () {
  	var cars = this.state.listings.filter(function(object) {
  		return object.category.name == "Cars"
  	});

    this.setState({current_listings: cars, title: "Car Listings"})  
  },

  filterHouses: function () {
  	var houses = this.state.listings.filter(function(object) {
  		return object.category.name == "Houses"
  	});

    this.setState({current_listings: houses, title: "House Listings"})  
  },

  filterJobs: function () {
  	var jobs = this.state.listings.filter(function(object) {
  		return object.category.name == "Jobs"
  	});

    this.setState({current_listings: jobs, title: "Job Listings"})  
  },

  sortListings: function () {
  	if (this.state.price) {
	  	var jobs = this.state.current_listings.sort(function(a, b) {
			  return a.price - b.price;
			});

	    this.setState({current_listings: jobs, price: false})  
  	} else {
	  	var jobs = this.state.current_listings.sort(function(a, b) {
			  return b.price - a.price;
			});

	    this.setState({current_listings: jobs, price: true})  
	  }
  },

	render: function() {
		var self = this;

	  var listings = self.state.current_listings.map(function(object) {
	  	var is_author = false;
	  	if (self.state.user) {
	  		is_author = self.state.user.id == object.user.id;
	  	}
      return <Listing 
    			this_id={object.id} 
    			image={object.image} 
    			title={object.title} 
    			count={object.count} 
    			price={object.price} 
    			description={object.description} 
    			expiry_date={object.expiry} 
    			user={object.user}
    			category={object.category}
    			admin={is_author}/>
    });

		return (
			<div className="container">
    		<div className="row">
	    		
	    		<div className="btn-group pull-right" role="group">
	    			<button type="button" className="btn btn-default" onClick={self.filterAll}>All</button>
	    			<button type="button" className="btn btn-default" onClick={self.filterCars}>Cars</button>
	    			<button type="button" className="btn btn-default" onClick={self.filterHouses}>Houses</button>
	    			<button type="button" className="btn btn-default" onClick={self.filterJobs}>Jobs</button>
	    			<button type="button" className="btn btn-default price-button" onClick={self.sortListings}>Price 
	    				{ self.state.price ? <span className="glyphicon glyphicon-menu-down"></span> : null }
	    				{ self.state.price == false ? <span className="glyphicon glyphicon-menu-up"></span> : null }
	    			</button>
	    		</div>
	    	</div>
	    	<h1 className="text-center">{ self.state.title }</h1>
    		<div className="row">
					{listings}
				</div>
			</div>
		)
	}
});