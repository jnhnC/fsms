<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="">
	<div class="container-fluid p-0">
		<div class="row mb-2 mb-xl-3">

		</div>
		<div class="row">
			<div class="col-12 col-sm-6 col-xxl d-flex">
				<div class="card illustration flex-fill">
					<div class="card-body p-0 d-flex flex-fill">
						<div class="row no-gutters w-100">
							<div class="col-6">
								<div class="illustration-text p-3 m-1">
									<div class="illustration-text">Welcome Back, Chris!</div>
									<p class="mb-0">AppStack Dashboard</p>
								</div>
							</div>
							<div class="col-6 align-self-end text-right">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-xxl d-flex">
				<div class="card flex-fill">
					<div class="card-body py-4">
						<div class="media">
							<div class="media-body">
								<div class="mb-2">$ 24.300</div>
								<p class="mb-2">Total Earnings</p>
								<div class="mb-0">
									<span class="badge badge-soft-success mr-2"> <i
										class="mdi mdi-arrow-bottom-right"></i> +5.35%
									</span> <span class="text-muted">Since last week</span>
								</div>
							</div>
							<div class="d-inline-block ml-3">
								<div class="stat">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-dollar-sign align-middle text-success">
										<line x1="12" y1="1" x2="12" y2="23"></line>
										<path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-xxl d-flex">
				<div class="card flex-fill">
					<div class="card-body py-4">
						<div class="media">
							<div class="media-body">
								<h3 class="mb-2">43</h3>
								<p class="mb-2">Pending Orders</p>
								<div class="mb-0">
									<span class="badge badge-soft-danger mr-2"> <i
										class="mdi mdi-arrow-bottom-right"></i> -4.25%
									</span> <span class="text-muted">Since last week</span>
								</div>
							</div>
							<div class="d-inline-block ml-3">
								<div class="stat">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-shopping-bag align-middle text-danger">
										<path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
										<line x1="3" y1="6" x2="21" y2="6"></line>
										<path d="M16 10a4 4 0 0 1-8 0"></path></svg>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-6 col-xxl d-flex">
				<div class="card flex-fill">
					<div class="card-body py-4">
						<div class="media">
							<div class="media-body">
								<h3 class="mb-2">$ 18.700</h3>
								<p class="mb-2">Total Revenue</p>
								<div class="mb-0">
									<span class="badge badge-soft-success mr-2"> <i
										class="mdi mdi-arrow-bottom-right"></i> +8.65%
									</span> <span class="text-muted">Since last week</span>
								</div>
							</div>
							<div class="d-inline-block ml-3">
								<div class="stat">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"
										class="feather feather-dollar-sign align-middle text-info">
										<line x1="12" y1="1" x2="12" y2="23"></line>
										<path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		</div>

		<div class="card flex-fill mt-5 pt-2">
			<div id="datatables-dashboard-projects_wrapper"
				class="dataTables_wrapper dt-bootstrap4 no-footer">
				<div class="row">
					<div class="col-sm-12">
						<table id="datatables-dashboard-projects"
							class="table table-striped my-0 dataTable no-footer" role="grid"
							aria-describedby="datatables-dashboard-projects_info">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatables-dashboard-projects" rowspan="1"
										colspan="1" aria-sort="ascending"
										aria-label="Name: activate to sort column descending">Name</th>
									<th class="d-none d-xl-table-cell sorting" tabindex="0"
										aria-controls="datatables-dashboard-projects" rowspan="1"
										colspan="1"
										aria-label="Start Date: activate to sort column ascending">Start
										Date</th>
									<th class="d-none d-xl-table-cell sorting" tabindex="0"
										aria-controls="datatables-dashboard-projects" rowspan="1"
										colspan="1"
										aria-label="End Date: activate to sort column ascending">End
										Date</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatables-dashboard-projects" rowspan="1"
										colspan="1"
										aria-label="Status: activate to sort column ascending">Status</th>
									<th class="d-none d-md-table-cell sorting" tabindex="0"
										aria-controls="datatables-dashboard-projects" rowspan="1"
										colspan="1"
										aria-label="Assignee: activate to sort column ascending">Assignee</th>
								</tr>
							</thead>
							<tbody>

								<tr role="row" class="odd">
									<td class="sorting_1">Project Apollo</td>
									<td class="d-none d-xl-table-cell">01/01/2018</td>
									<td class="d-none d-xl-table-cell">31/06/2018</td>
									<td><span class="badge badge-success">Done</span></td>
									<td class="d-none d-md-table-cell">Carl Jenkins</td>
								</tr>
								<tr role="row" class="even">
									<td class="sorting_1">Project Fireball</td>
									<td class="d-none d-xl-table-cell">01/01/2018</td>
									<td class="d-none d-xl-table-cell">31/06/2018</td>
									<td><span class="badge badge-danger">Cancelled</span></td>
									<td class="d-none d-md-table-cell">Bertha Martin</td>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1">Project Hades</td>
									<td class="d-none d-xl-table-cell">01/01/2018</td>
									<td class="d-none d-xl-table-cell">31/06/2018</td>
									<td><span class="badge badge-success">Done</span></td>
									<td class="d-none d-md-table-cell">Stacie Hall</td>
								</tr>
								<tr role="row" class="even">
									<td class="sorting_1">Project Nitro</td>
									<td class="d-none d-xl-table-cell">01/01/2018</td>
									<td class="d-none d-xl-table-cell">31/06/2018</td>
									<td><span class="badge badge-warning">In progress</span></td>
									<td class="d-none d-md-table-cell">Carl Jenkins</td>
								</tr>
								<tr role="row" class="odd">
									<td class="sorting_1">Project Phoenix</td>
									<td class="d-none d-xl-table-cell">01/01/2018</td>
									<td class="d-none d-xl-table-cell">31/06/2018</td>
									<td><span class="badge badge-success">Done</span></td>
									<td class="d-none d-md-table-cell">Bertha Martin</td>
								</tr>
								<tr role="row" class="even">
									<td class="sorting_1">Project Romeo</td>
									<td class="d-none d-xl-table-cell">01/01/2018</td>
									<td class="d-none d-xl-table-cell">31/06/2018</td>
									<td><span class="badge badge-success">Done</span></td>
									<td class="d-none d-md-table-cell">Ashley Briggs</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-5">
					</div>
					<div class="col-sm-12 col-md-7 pt-3 pb-3" style="font-size:8pt;">
						<div class="dataTables_paginate paging_simple_numbers"
							id="datatables-dashboard-projects_paginate">
							<ul class="pagination">
								<li class="paginate_button page-item previous disabled"
									id="datatables-dashboard-projects_previous"><a href="#"
									aria-controls="datatables-dashboard-projects" data-dt-idx="0"
									tabindex="0" class="page-link">Previous</a></li>
								<li class="paginate_button page-item active"><a href="#"
									aria-controls="datatables-dashboard-projects" data-dt-idx="1"
									tabindex="0" class="page-link">1</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="datatables-dashboard-projects" data-dt-idx="2"
									tabindex="0" class="page-link">2</a></li>
								<li class="paginate_button page-item next"
									id="datatables-dashboard-projects_next"><a href="#"
									aria-controls="datatables-dashboard-projects" data-dt-idx="3"
									tabindex="0" class="page-link">Next</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<div>
</div>
