angular.module('starter.controllers', [])
    

.controller('MyCtrl', function($scope){
	$scope.items = ['Melon','Graps','Pear','Banana','Tomato','Ginger','Pineapple','Apple','Orange','Strawberry','Cucumber'];
	$scope.moveItem = function(item, fromIndex, toIndex){
		$scope.items.splice(fromIndex, 1);
		$scope.items.splice(toIndex, 0, item);
	};

	$scope.categories = ['Books','Fruits & Vegetables','Medicines','Grocery','Home Appliances'];
	$scope.moveCategory = function(category, fromIndex, toIndex){
		$scope.categories.splice(fromIndex, 1);
		$scope.categories.splice(toIndex, 0, category);
	};

	$scope.categorySelected = function(){
		alert("hi");
		//alert(index);
	};


});
