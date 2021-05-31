//
//  LoginViewController.swift
//  SampleProject
//
//  Created by Alihan Aktay on 1.04.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let titleLabel = UILabelBuilder()
            .text(L10n.Modules.LoginViewController.title)
            .textColor(.appCinder)
            .font(.font(.nunitoBold, size: .xxLarge))
            .build()
    
    private let stackView = UIStackViewBuilder()
            .axis(.vertical)
            .spacing(15)
            .build()
    
    private let bottomStackView = UIStackViewBuilder()
            .axis(.horizontal)
            .spacing(4)
            .build()
    
    private let bottomLabel = UILabelBuilder()
            .text(L10n.Modules.LoginViewController.bottomText)
            .font(.font(.nunitoBold, size: .xLarge))
            .textColor(.appRaven)
            .build()
    
    private let registerButton = UIButtonBuilder()
            .titleColor(.appRed)
            .titleFont(.font(.nunitoBold, size: .xLarge))
            .title(L10n.General.register, for: .normal)
            .build()
    
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.nunitoSemiBold, size: .large))
        .titleColor(.appRaven)
        .build()
    
    private let emailTextField = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    private let ctaButton = ButtonFactory.createPrimaryButton(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setUIElements()
        setupCancelRightBarButton()
    }
    
    private func configureContents() {
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        view.addSubview(forgotPasswordButton)
        titleLabel.topToSuperview(usingSafeArea: true).constant = 50
        titleLabel.centerXToSuperview()
        titleLabel.bottomToTop(of: stackView).constant = -50
        stackView.leadingToSuperview().constant = 15
        stackView.trailingToSuperview().constant = -15
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(ctaButton)
        forgotPasswordButton.topToBottom(of: stackView).constant = 10
        forgotPasswordButton.trailingToSuperview().constant = -15
        forgotPasswordButton.height(20)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.centerXToSuperview()
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(registerButton)
        registerButton.addTarget(self, action: #selector(regiserButtonTapped), for: .touchUpInside)
        ctaButton.addTarget(self, action: #selector(ctaButtonTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func setUIElements() {
        emailTextField.title = L10n.Placeholder.email
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        emailTextField.leftImage = .icMail
        passwordTextField.title = L10n.Placeholder.password
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        ctaButton.setTitle(L10n.General.login, for: .normal)
        forgotPasswordButton.setTitle(L10n.Modules.LoginViewController.forgotPassword, for: .normal)
    }
    
    private func setupCancelRightBarButton() {
        let image = UIImage.icClose.withRenderingMode(.alwaysTemplate)
        let cancelBarButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(dismissLoginViewController))
        cancelBarButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = cancelBarButton
    }
    
    // MARK: - Action
    @objc
    private func regiserButtonTapped() {
        viewModel.showRegisterOnWindow()
    }
    
    @objc
    private func ctaButtonTapped() {
        view.endEditing(true)
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            showWarningToast(message: L10n.Error.emptyFields)
            return
        }
        let validation = Validation()
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendLoginRequest(username: email, password: password)
    }
    
    @objc
    private func forgotPasswordButtonTapped() {
        viewModel.pushPasswordResetScene()
    }
    
    @objc
    private func dismissLoginViewController() {
        viewModel.dismissLoginScene()
    }
}
