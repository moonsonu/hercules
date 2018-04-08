/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ksonu <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/03 17:02:46 by ksonu             #+#    #+#             */
/*   Updated: 2018/03/04 19:28:00 by ksonu            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int	main(int ac, char **av)
{
	int	n_socket;
	struct	sockaddr_in	server_address;
	int	connections_status;
	char	server_response[20];
	int	response_len;
	char	client_message[20];

	if (ac == 3)
	{
		n_socket = socket(AF_INET, SOCK_STREAM, 0);
		if (n_socket == -1)
			return (-1);
		/* sepcify an address for the socket */
		memset(&server_address, 0, sizeof(server_address));
		server_address.sin_family = AF_INET;
		server_address.sin_port = htons(atoi(av[2]));
		server_address.sin_addr.s_addr = inet_addr(av[1]);
		connections_status = connect(n_socket, (struct sockaddr *)&server_address, sizeof(server_address));
		/* check for error with the connection */
		if (connections_status == -1)
			printf("There was an error making a connection to the remote socket \n\n");
		/* recieve data from the server */
		response_len = read(n_socket, server_response, sizeof(server_response) - 1);
		if (response_len == -1)
			return (-1);
		server_response[response_len] = '\0';

		/* print out the server's response */
		printf("The server sent the message: %s\n", server_response);

		/* and then close the socket */
		close(n_socket);
	}
	return (0);
}
