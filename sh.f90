!---------------------------------------------------------------------- 
!
! localized pulses of the quadratic-cubic Swift-Hohenberg equation
! 			0 = -(1+Delta)^2 u - mu u + nu u^2 - u^3
!
!---------------------------------------------------------------------- 

subroutine func(ndim,u,icp,par,ijac,f,dfdu,dfdp)

	implicit none
	integer, intent(in) :: ndim, ijac, icp(*)
	double precision, intent(in) :: u(ndim), par(*)
	double precision, intent(out) :: f(ndim)
	double precision, intent(inout) :: dfdu(ndim,*), dfdp(ndim,*)

	double precision mu,nu
	integer j
    
	f(1) = u(2);
	f(2) = u(3) - u(1);
	f(3) = u(4);
	f(4) = - u(3) - par(1)*u(1) + par(2)*u(1)*u(1) - u(1)*u(1)*u(1);
	f(5) = 0.0

	do j=1,ndim
		f(j) = par(11)*f(j)
	end do

end subroutine func

!---------------------------------------------------------------------- 

subroutine stpnt(ndim,u,par,t)

	implicit none
	integer, intent(in) :: ndim
	double precision, intent(inout) :: u(ndim), par(*)
	double precision, intent(in) :: t

	par(1)  = 0.2			! mu
	par(2)  = 1.6			! nu
	par(11) = 6.2832		! period

	par(3)  = 0.0			! Hamiltonian H
	par(4)  = 0.0			! vector field S
	par(5)  = 0.0			! energy E

end subroutine stpnt

!---------------------------------------------------------------------- 

subroutine bcnd(ndim,par,icp,nbc,u0,u1,fb,ijac,dbc)

	implicit none
	integer, intent(in) :: ndim, icp(*), nbc, ijac
	double precision, intent(in) :: par(*), u0(ndim), u1(ndim)
	double precision, intent(out) :: fb(nbc)
	double precision, intent(inout) :: dbc(nbc,*)

	! Neumann boundary conditions
	fb(1) = u0(2)
	fb(2) = u0(4)
	fb(3) = u1(2)
	fb(4) = u1(4)
	fb(5) = u0(5) - par(3)

end subroutine bcnd

!---------------------------------------------------------------------- 

subroutine icnd(ndim,par,icp,nint,u,uold,udot,upold,fi,ijac,dint)

	implicit none
	integer, intent(in) :: ndim, icp(*), nint, ijac
	double precision, intent(in) :: par(*)
	double precision, intent(in) :: u(ndim), uold(ndim), udot(ndim), upold(ndim)
	double precision, intent(out) :: fi(nint)
	double precision, intent(inout) :: dint(nint,*)

    ! Hamiltonian H
	fi(1) = u(2)*u(4) + u(1)*u(3) - u(3)*u(3)/2. + par(1)*u(1)*u(1)/2. &
		-par(2)*u(1)*u(1)*u(1)/3. + u(1)*u(1)*u(1)*u(1)/4. - par(3);

	! vector field S
	fi(2) = -2.*u(2)*u(4) - par(4);

end subroutine icnd

!---------------------------------------------------------------------- 

subroutine pvls(ndim,u,par)

	implicit none
	integer, intent(in) :: ndim
	double precision, intent(in) :: u(ndim)
    double precision, intent(inout) :: par(*)
    double precision getp

	! energy E = S+H
	par(5) = par(3) + par(4)

end subroutine pvls

!---------------------------------------------------------------------- 

subroutine fopt
end subroutine fopt

!---------------------------------------------------------------------- 
