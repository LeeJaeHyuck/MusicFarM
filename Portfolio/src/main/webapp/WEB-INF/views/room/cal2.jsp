<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<div class="modal fade" id="roomReserveListModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
			</div>
			<div class="modal-body">
			<input type="hidden" id="roomReserveNo" value="">
			<input type="hidden" id="ddayYear" value="0">
			<input type="hidden" id="ddayMonth" value="0">
			                  <div class="panel-body">
                        <div class="calendar fc fc-ltr">
                    
                            <table class="fc-header" style="width:100%">
                                <tbody>
                                    <tr>
                                        <td class="fc-header-left">
                                            <div class="btn-group">
                                                <button type="button" class="fc-button-prev fc-corner-left btn btn-default btn-sm calendarMoveBtn" ddayOption="prev"> <i class="fa fa-chevron-left"></i>

                                                </button>
                                                <button type="button" class="btn btn-default btn-sm calendarMoveBtn" ddayOption="next"> <i class="fa fa-chevron-right"></i>

                                                </button>
                                            </div> 
                                        </td>
                                        <td class="fc-header-center"> <span class="fc-header-title">          <h2 id="calendarTitle">January 2014</h2>          </span>

                                        </td>
                                        <td class="fc-header-right">

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="fc-content" style="position: relative; min-height: 1px;">
                                <div class="fc-view fc-view-month fc-grid" style="position: relative; min-height: 1px;" unselectable="on">
                                    <table class="fc-border-separate" cellspacing="0">
                                        <thead>
                                            <tr class="fc-first fc-last">
                                                <th class="fc-day-header fc-sun fc-widget-header fc-first" style="width: 158px;">Sun</th>
                                                <th class="fc-day-header fc-mon fc-widget-header" style="width: 158px;">Mon</th>
                                                <th class="fc-day-header fc-tue fc-widget-header" style="width: 158px;">Tue</th>
                                                <th class="fc-day-header fc-wed fc-widget-header" style="width: 158px;">Wed</th>
                                                <th class="fc-day-header fc-thu fc-widget-header" style="width: 158px;">Thu</th>
                                                <th class="fc-day-header fc-fri fc-widget-header" style="width: 158px;">Fri</th>
                                                <th class="fc-day-header fc-sat fc-widget-header fc-last" style="width: 158px;">Sat</th>
                                            </tr>
                                        </thead>
                                        <tbody id="calendarListTbody">
											<tr><td>${calendarList}</td></tr>
											<tr><td>${ddayYear}</td></tr>
											<tr><td>${ddayMonth}</td></tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

    