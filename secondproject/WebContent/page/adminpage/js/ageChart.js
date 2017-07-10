function getAge(snum) {
	document.location.href = "/secondproject/chart?act=ageChart&snum="+snum;
}

function yearStats() {
	$.ajax({
		method: 'get',
		url: '/secondproject/chart',
		data: {
			'act': 'ageYear',
		},
		dataType: 'json',
		success: function(data) {
			myChart.destroy();
			var ctx = document.getElementById("ageChart").getContext("2d");
			myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			    	labels: ["a", "b", "c", "d", "e", "f", "h", "i", "j", "k"],
			        datasets: [{
			            label: '���� ������ ��',
			            data: ["", "", "", "", "", "", "", "", "", ""],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255,99,132,1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255,99,132,1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        }
			    }
			});
			console.log(data);
			for (var i = 0; i <data.length; i++) {
				myChart.data.labels[i] = data[i].regdate;	
				myChart.data.datasets[0].data[i] = data[i].dateCount;	
			}
				myChart.update();
		}
	})
}

function getAjaxAge(snum) {
	$.ajax({
		method: 'get',
		url: '/secondproject/chart',
		data: {
			'act': 'ageAjax',
			'snum': snum
		},
		dataType: 'json',
		success: function(data) {
			myChart.destroy();
			var ctx = document.getElementById("ageChart").getContext("2d");
			myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ["Red", "Blue", "Yellow", "Green", "Purple"],
			        datasets: [{
			            label: '������ ��',
			            data: ["", "", "", "", ""],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255,99,132,1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        }
			    }
			});
			for (var i = 0; i <data.length; i++) {
					myChart.data.labels[i] = data[i].age;	
					myChart.data.datasets[0].data[i] = data[i].ageCount;	
			}
					myChart.update();
		}
	})
}
