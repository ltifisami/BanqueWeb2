package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.entities.Broker;
import metier.entities.Compte;
import metier.session.IBanqueLocal;
import metier.session.IBrokerLocal;

public class BanqueServlet extends HttpServlet {
	
	@EJB
	private IBanqueLocal metier;
	
	@EJB
	private IBrokerLocal metierBroker;
	
	private Map<String,List<Integer>> listBroker = new HashMap<String ,List<Integer>>();
	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	
	@Override
	   protected void doPost(HttpServletRequest request,
	           HttpServletResponse response) throws ServletException, IOException {
	       this.doGet(request, response);
	   }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertAccount(request, response);
				break;
			case "/delete":
				deleteAccount(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateAccount(request, response);
				break;
			case "/insertBroker":
				insertBroker(request, response);
				break;
			case "/deleteBroker":
				deleteBroker(request, response);
				break;
			case "/editBroker":
				showEditForm(request, response);
				break;
			case "/updateBroker":
				updateBroker(request, response);
				break;
			case "/broker":
				getAllBrokers(request, response);
				break;
			default:
				home(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);}
		}
	
	private void home(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Compte> listCompte = metier.getAllComptes();
		boolean addd= true;
	    request.setAttribute("add", addd);
		request.setAttribute("listeCompte", listCompte);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/home.jsp");
		dispatcher.forward(request, response);
	}
	
		
		
		private void showNewForm(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			boolean addd= true;
		    request.setAttribute("add", addd);
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/compte-form.jsp");
			dispatcher.forward(request, response);
		}

		private void showEditForm(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, ServletException, IOException {
			boolean addd= true;
		    request.setAttribute("add", addd);
			Long code = Long.parseLong(request.getParameter("code"));
			Compte existingCompte = metier.getCompte(code);
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/compte-form.jsp");
			request.setAttribute("compte", existingCompte);
			dispatcher.forward(request, response);

		}

		private void insertAccount(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			double solde =Double.parseDouble(request.getParameter("solde")) ;
			Compte c= new Compte(solde, new Date(), true);
			metier.addCompte(c);
			boolean addd= false;
		    request.setAttribute("add", addd);
			response.sendRedirect("list");
		}
		private void insertBroker(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			String ccpId =request.getParameter("ccpId") ;
			String name =request.getParameter("name") ;
			String brokermemberID =request.getParameter("brokermemberID") ;
			
			Broker br= new Broker(name,ccpId,brokermemberID);
			metierBroker.addBroker(br);
			response.sendRedirect("list");
		}
		private void deleteBroker(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			Long codeB = Long.parseLong(request.getParameter("codeB"));
			metierBroker.deleteBroker(codeB);
			response.sendRedirect("home");
		
		
	}
		private void updateBroker(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			Long codeB = Long.parseLong(request.getParameter("codeB"));
			Broker br= metierBroker.getBroker(codeB);
	     	br.setName(request.getParameter("name"));
	     	br.setCCP_ID(request.getParameter("ccpId"));
	     	br.setBrokermember_ID(request.getParameter("brokermember_ID"));
		    metierBroker.updateBroker(br);
			response.sendRedirect("home");
		}

		private void updateAccount(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			Long code = Long.parseLong(request.getParameter("code"));
			Compte c= metier.getCompte(code);
	     	c.setSolde(Double.parseDouble(request.getParameter("solde")));
		    metier.updateCompte(c);
			response.sendRedirect("home");
		}

		private void deleteAccount(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			Long code = Long.parseLong(request.getParameter("code"));
			metier.deleteCompte(code);
			response.sendRedirect("home");
		
		
	}
		private void getAllBrokers(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException, ServletException {
			
			List<Integer> l1 = new ArrayList();
			List<Integer> l2 = new ArrayList();
			List<Integer> l3 = new ArrayList();
			
			
			l1.add(new Integer(1));
			l1.add(new Integer(1));
			l1.add(new Integer(1));
			
			l2.add(new Integer(11));
			l2.add(new Integer(12));
			l2.add(new Integer(13));
			
			
			l3.add(new Integer(111));
			l3.add(new Integer(122));
			l3.add(new Integer(133));
			
				listBroker.put(new String("A"), l1);
				
				listBroker.put(new String("B"), l2);
				
				listBroker.put(new String("C"),l3);
				
				
				request.setAttribute("listBroker", listBroker);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/broker-liste.jsp");
			dispatcher.forward(request, response);
	}
}
