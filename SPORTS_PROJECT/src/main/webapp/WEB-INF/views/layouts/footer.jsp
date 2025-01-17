<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<footer>
	<div class="footer-top d-flex">
           <div class="footer-top-left d-flex">
               <img class="logo" src='${contextPath }/public/images/mlb_logo2.jpg'>
               <div class="footer-top-anno d-flex">
                   <p class="fs-14__ex fc__dgray mr-10"> 공지사항 </p>
                   <p class="fs-14 fc__gray text-hover__gray"> KH 커뮤니티 페이지가 오픈했습니다! </p>
               </div>
           </div>
           <div class="footer-top-right d-flex">
               <a class="fs-12 fc__gray text-hover__gray" href="${contextPath}/dashboard"> HOME </a> <span> &#183;</span>
               <a class="fs-12 fc__gray text-hover__gray" href="${contextPath}/match"> MATCH </a> <span> &#183;</span>
               <a class="fs-12 fc__gray text-hover__gray" href="${contextPath}/news"> NEWS </a> <span> &#183;</span>
               <a class="fs-12 fc__gray text-hover__gray" href="${contextPath}/community"> COMMUNITY </a> <span> &#183;</span>
               <a class="fs-12 fc__gray text-hover__gray" href="${contextPath}/teams"> TEAMS </a>
           </div>
       </div>
       <div class="footer-bot d-flex">
           <div class="footer-bot-nav d-flex">
               <ul class="d-flex m-10">
                   <li class="fc__gray text-hover__gray" onclick="logout()">LOGOUT</li>
               </ul>
           </div>
           <p class="footer-bot-warn fc__gray"> 본 콘텐츠의 저작권은 제공처 또는 GPT야 도와조에게 있으며, 이를 무단 이용하는 경우 저작권법 등에 따라 법적 책임을 질 수 있습니다. </p>
       </div>
</footer>
